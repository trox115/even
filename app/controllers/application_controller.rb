class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def hello
  render html: 'Hello world'
  end

  def log_out
    session.delete(:name)
    @current_user=nil
  end

  def logged_in
    return if current_user
    redirect_to login_url
  end

  def not_logged_in
    return unless current_user
    redirect_to root_path
  end
end
