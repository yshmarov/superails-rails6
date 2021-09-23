# frozen_string_literal: true
class ApplicationMailer < ActionMailer::Base
  default from: 'hello@superails.com'
  layout 'mailer'
end
