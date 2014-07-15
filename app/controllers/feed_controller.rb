require 'addressable/uri'
require 'atom'

class FeedController < ApplicationController
  respond_to :atom

  def show
    trips = Trip.order(starts_on: :desc).order(ends_on: :desc).page(params[:page]).per(params[:per])
    feed = FeedBuilder.new(trips, params.slice(:page, :per)).build
    respond_with(OpenStruct.new(feed: feed, trips: trips))
  end

  class FeedBuilder < Struct.new(:trips, :options)
    include Rails.application.routes.url_helpers

    def build
      Atom::Feed.new do |feed|
        feed.id = "tag:oac-trip-calendar.herokuapp.com,2014-07-01:#{feed_path}"
        feed.title = 'OAC trip feed'
        feed.updated = last_trip_update
        feed.links << Atom::Link.new(href: root_url, rel: :via, type: 'text/html')
        feed.links << Atom::Link.new(href: self_url, rel: :self, type: 'application/atom_xml')
        if trips.total_pages > 1
          feed.links << Atom::Link.new(href: first_url, rel: :first, type: 'application/atom_xml')
          if trips.current_page > 1
            feed.links << Atom::Link.new(href: prev_url, rel: :previous, :type => 'application/atom+xml')
          end
          if trips.current_page < trips.total_pages
            feed.links << Atom::Link.new(href: next_url, rel: :next, type: 'application/atom+xml')
          end
          feed.links << Atom::Link.new(href: last_url, rel: :last, type: 'application/atom+xml')
        end
        trips.each do |trip|
          feed.entries << Atom::Entry.new do |entry|
            entry.id = "tag:oac-trip-calendar.herokuapp.com,2014-07-01:#{trip.uuid}"
            entry.title = trip.name
            entry.published = trip.created_at
            entry.links << Atom::Link.new(href: trip.url, rel: :alternate, type: 'text/html')
            entry.categories << Atom::Category.new(label: trip.category, term: trip.category)
          end
        end
      end
    end

    def last_trip_update
      updated = nil
      trips.each do |trip|
        if updated.nil? || trip.updated_at > updated
          updated = trip.updated_at
        end
      end
      updated
    end

    def self_url
      @self_url ||= Addressable::URI.parse(feed_url(format: :atom, page: options[:page], per: options[:per]))
    end

    def first_url
      self_url.dup.tap do |copy|
        copy.query_values = hashify_query_values(copy).merge(
          'page' => '1',
          'per' => trips.limit_value.to_s
        )
      end
    end

    def next_url
      self_url.dup.tap do |copy|
        copy.query_values = hashify_query_values(copy).merge(
          'page' => (trips.current_page + 1).to_s,
          'per' => trips.limit_value.to_s
        )
      end
    end

    def prev_url
      self_url.dup.tap do |copy|
        copy.query_values = hashify_query_values(copy).merge(
          'page' => (trips.current_page - 1).to_s,
          'per' => trips.limit_value.to_s
        )
      end
    end

    def last_url
      self_url.dup.tap do |copy|
        copy.query_values = hashify_query_values(copy).merge(
          'page' => trips.total_pages.to_s,
          'per' => trips.limit_value.to_s
        )
      end
    end

  private
    def hashify_query_values(uri)
      (uri.query_values(Array) || []).each_with_object({}) { |(key, val), m| m[key] ||= []; m[key] << val}
    end
  end

  class AtomFeedResponder < ActionController::Responder
    def to_atom
      if Rails.env.development? || controller.stale?(etag: resource.trips)
        filename = "#{resource.feed.title}.atom"
        controller.send_data(resource.feed.to_xml, filename: filename, type: :atom, disposition: 'inline')
      end
    end
  end

protected
  def self.responder
    AtomFeedResponder
  end
end
