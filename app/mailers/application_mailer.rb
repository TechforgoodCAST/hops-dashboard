# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'CAST <no-reply@wearecast.org.uk>'
  layout 'mailer'
end
