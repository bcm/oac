require 'feedbuilder'

class FeedController < ApplicationController
  respond_to :atom

  def show
    trips = Trip.order(starts_on: :desc).order(ends_on: :desc).page(params[:page])
    feed = AtomFeedBuilder.new(trips, page: params[:page]).build
    respond_with(OpenStruct.new(feed: feed, trips: trips))
  end

  class AtomFeedBuilder < Struct.new(:trips, :options)
    include FeedBuilder::Provider
    include Rails.application.routes.url_helpers

    def build
      # XXX: make this respect the paginated relation's limit_value so pagination links are generated
      build_feed(trips, url_builder, feed_title: "OAC trip feed") do |trip, entry|
        entry.id = feed_tag_uri(trip.uuid)
        entry.title = trip.name
        entry.published = trip.created_at
        entry.links << Atom::Link.new(href: trip.url, rel: 'alternate', type: 'text/html')
        Atom::Category.new(label: trip.category, term: trip.category)
      end
    end

    def url_builder
      FeedBuilder::UrlBuilder.new(root_url, root_url, feed_url(format: :atom, page: options[:page]))
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
