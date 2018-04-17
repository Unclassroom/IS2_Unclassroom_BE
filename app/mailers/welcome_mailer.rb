class WelcomeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.welcome_mailer.new_user.subject
  #
  def new_user(user)
    @user = user
    mail to: @user.email, subject: "Welcome to UNClassroom!"
  end
end
