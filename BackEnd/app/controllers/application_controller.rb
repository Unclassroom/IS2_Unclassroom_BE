class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  #protect_from_forgery
  # acts_as_token_authentication_handler_for User
  #before_action :authenticate_user!
end
