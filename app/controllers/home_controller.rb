class HomeController < ApplicationController
  def index
    @date = Date.today
    period = [@date.beginning_of_month.beginning_of_week, @date.end_of_month.end_of_week]
    trips = Trip.in_period(*period)
    defaults = (period.first..period.last).each_with_object({}) { |date, m| m[date] = [] }
    @trips = trips.each_with_object(defaults) do |trip, m|
      (trip.starts_on..trip.ends_on).each { |date| m[date] << trip }
    end
  end
end