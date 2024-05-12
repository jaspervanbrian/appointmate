class ApplicationMailer < ActionMailer::Base
  default from: "AppointMate <#{Rails.application.credentials.gmail.email}>"
  layout "mailer"
end
