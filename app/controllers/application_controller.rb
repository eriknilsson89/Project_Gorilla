class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  before_filter :check_cookies
  include SessionsHelper
def set_locale
  I18n.locale = params[:sv] || I18n.default_locale
end
def check_cookies
  if !cookies[:remember_token].nil? && !signed_in?
    #user = User.authenticate_with_salt(*remember_token)
    #sign_in_with_cookies user
  end
end
end
