module AppointmentNotifier
  extend ActiveSupport::Concern

  included do
    after_action :notify_patient, only: [:create]
  end

  private

  def notify_patient
    if @booking.present? && @hospital.present? && @booking_type.present?
    end
  end
end
