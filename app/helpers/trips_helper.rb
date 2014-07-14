module TripsHelper
  def trip_popover_content(trip)
    out = []
    out << content_tag(:span, trip.name, class: 'trip-name')
    out << tag(:br)
    out << content_tag(:span, trip_period(trip), class: 'trip-period')
    out << tag(:br)
    out << link_to(trip.url, target: 'oac') do
      raw('More details ' + fa_icon('external-link'))
    end
    # don't safe_join so that the output will be escaped - the popover markup requires this
    out.join("\n")
  end

  def trip_period(trip)
    out = []
    case
    when trip.starts_on == trip.ends_on
      out << trip.starts_on.strftime("%b %e")
    when trip.starts_on.mon == trip.ends_on.mon
      out << trip.starts_on.strftime("%b %e")
      out << '-'
      out << trip.ends_on.strftime("%e")
    else
      out << trip.starts_on.strftime("%b %e")
      out << '-'
      out << trip.ends_on.strftime("%b %e")
    end
    out.join('')
  end
end
