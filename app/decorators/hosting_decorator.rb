class HostingDecorator < Draper::Decorator
  delegate_all

  def location
    city? && state? ? "#{city}, #{state.to_s}" : zipcode
  end

  def num_guest_details
    max_guests > 1 ? " #{max_guests} guests" : " #{max_guests} guest"
  end

  def guest_details
    pretty_accomodation_type + ", " + num_guest_details
  end

  def pretty_accomodation_type
    accomodation_type == 'home' ? 'private home' : 'hotel share'
  end

  def short_details
    details = guest_details
    details << " (#{start_and_end_dates})"
  end
end
