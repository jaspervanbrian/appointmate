class HospitalsController < ApplicationController
  layout 'hospitals'

  def dashboard
    @booking_types = current_hospital.booking_types
    @bookings = Booking.where(booking_type_id: current_hospital.booking_type_ids)
  end

  def show
    @hospital ||= Hospital.find_by(booking_link: params[:booking_link])
  end
end
