# Preview all emails at http://localhost:3000/rails/mailers/cron_mailer
class CronMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/cron_mailer/pending_requests
  def pending_requests
    CronMailer.pending_requests
  end

end
