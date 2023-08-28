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

  def current_user_admin?
    current_user&.admin?
  end

  helper_method :current_user_admin?

  def require_admin
    return if current_user_admin?

    redirect_to events_url, alert: 'Unauthorized access!'
  end

  def current_user?(user)
    current_user == user
  end

  helper_method :current_user?
end
