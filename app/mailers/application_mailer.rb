class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@doctopus.com"
  layout 'mailer'
end
