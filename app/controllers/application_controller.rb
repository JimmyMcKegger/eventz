# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def require_signin
    return if current_user

    session[:intended_url] = request.url
    redirect_to new_session_url, alert: 'Please sign in!'
  end

  def current_user?(user)
    current_user == user
  end

  helper_method :current_user?
end
