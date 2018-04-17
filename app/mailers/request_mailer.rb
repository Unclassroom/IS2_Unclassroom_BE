class RequestMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.request_mailer.new_request.subject
  #
  def new_request(request)
    @request = request
    @teacher = @request.teacher
    mail to: @teacher.email, subject: "You just made request, great! "
  end
end
