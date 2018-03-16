class ApplicationMailer < ActionMailer::Base
    default from: 'no-reply@cookmeup.restaurant'
    layout 'mailer'
end
