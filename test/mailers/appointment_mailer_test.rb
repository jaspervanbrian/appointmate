require "test_helper"

class AppointmentMailerTest < ActionMailer::TestCase
  test "new_appointment_email" do
    mail = AppointmentMailer.new_appointment_email
    assert_equal "New appointment email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
