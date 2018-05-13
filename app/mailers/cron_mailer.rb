class CronMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.cron_mailer.pending_requests.subject
  #
  def pending_requests
    

    mail to: "fffeelipe@hotmail.com", subject: "Daily resume"
  end
end
