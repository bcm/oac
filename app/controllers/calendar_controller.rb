require 'icalendar'

class CalendarController < ApplicationController
  respond_to :ics

  def show
    trips = Trip.order(starts_on: :desc).order(ends_on: :desc)
    calendar = CalendarBuilder.new(trips).build
    respond_with(OpenStruct.new(calendar: calendar, trips: trips))
  end

  class CalendarBuilder < Struct.new(:trips)
    def build
      Icalendar::Calendar.new.tap do |calendar|
        calendar.prodid = '-//oac-trip-calendar'
        trips.each do |trip|
          calendar.add_event(build_event(trip))
        end
      end
    end

    def build_event(trip)
      Icalendar::Event.new.tap do |event|
        event.uid = trip.uuid
        event.dtstart = Icalendar::Values::Date.new(trip.starts_on)
        event.dtend = Icalendar::Values::Date.new(trip.ends_on)
        event.url = trip.url
        event.summary = trip.name
        event.categories = [trip.category]
      end
    end
  end

  class CalendarResponder < ActionController::Responder
    def to_ics
      filename = "OAC trip calendar.ics"
      if Rails.env.development? || controller.stale?(etag: resource.trips)
        controller.send_data(resource.calendar.to_ical, filename: filename, type: :ics, disposition: 'inline')
      end
    end
  end

protected
  def self.responder
    CalendarResponder
  end
end
