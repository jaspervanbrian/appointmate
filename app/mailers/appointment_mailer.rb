class AppointmentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.appointment_mailer.new_appointment_email.subject
  #
  def new_appointment_email(booking, booking_type, hospital)
    @booking = booking
    @booking_type = booking_type
    @hospital = hospital

    @duration = duration(@booking_type)
    mail to: booking.email, subject: 'Your appointment has been confirmed!'
  end

  def duration(type)
    if type.duration >= 60
      "#{(type.duration.to_f/60).round(1)} hr#{type.duration === 60 ? "" : "s"}"
    else
      type.duration.to_formatted_s + " mins"
    end
  end
end
