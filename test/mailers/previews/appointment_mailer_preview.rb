# Preview all emails at http://localhost:3000/rails/mailers/appointment_mailer
class AppointmentMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/appointment_mailer/new_appointment_email
  def new_appointment_email
    booking = Booking.last
    booking_type = booking.booking_type
    hospital = booking_type.hospital
    AppointmentMailer.new_appointment_email(booking, booking_type, hospital)
  end

end
