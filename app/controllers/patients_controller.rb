class PatientsController < ApplicationController
  before_action :authenticate_patient!

  def dashboard
    @all_bookings = current_patient.bookings.order("start_at")
    @upcoming_bookings = current_patient.bookings.approved.where("start_at >= ?", Time.now).order("start_at")
    @past_bookings = current_patient.bookings.approved.where("start_at < ?", Time.now).order("start_at")

    @approved_bookings = current_patient.bookings.approved
    @pending_bookings = current_patient.bookings.pending
    @unapproved_bookings = current_patient.bookings.unapproved

    @hospitals = Hospital.order("name").all
  end
end
