class HospitalsController < ApplicationController
  before_action :hospital

  def show
  end

  private

  def hospital
    @hospital ||= Hospital.find_by(booking_link: params[:booking_link])
  end
end
