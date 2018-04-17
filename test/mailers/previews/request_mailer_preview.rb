# Preview all emails at http://localhost:3000/rails/mailers/request_mailer
class RequestMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/request_mailer/new_request
  def new_request
    request = Request.first
    RequestMailer.new_request(request)
  end

end
