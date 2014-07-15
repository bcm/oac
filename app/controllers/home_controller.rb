class HomeController < ApplicationController
  def index
    @date = if params[:year].present? && params[:mon].present?
      Date.parse("#{params[:year]}-#{params[:mon]}-01")
    else
      Date.today
    end
    @prev_date = @date.beginning_of_month - 1
    @next_date = @date.end_of_month + 1
    period = [@date.beginning_of_month.beginning_of_week, @date.end_of_month.end_of_week]
    trips = Trip.in_period(*period).order(category: :asc)
    defaults = (period.first..period.last).each_with_object({}) { |date, m| m[date] = [] }
    @trips = trips.each_with_object(defaults) do |trip, m|
      (trip.starts_on..trip.ends_on).each { |date| m[date] ||= []; m[date] << trip }
    end
  end
end
