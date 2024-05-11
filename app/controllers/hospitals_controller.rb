class HospitalsController < ApplicationController
  before_action :authenticate_hospital!, only: :dashboard

  layout 'hospitals'

  def dashboard
    @booking_types ||= current_hospital.booking_types.order("name")
    @bookings = Booking.where(booking_type_id: current_hospital.booking_type_ids)
  end

  def show
    @hospital ||= Hospital.find_by(booking_link: params[:booking_link])
    @booking_types ||= @hospital.booking_types.order("name")
  end
end
