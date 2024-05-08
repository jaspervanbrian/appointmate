class PatientsController < ApplicationController
  def show
    @hospital = Hospital.find_by(booking_link: params[:booking_link])
  end
end
