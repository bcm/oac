module Authenticatable
  extend ActiveSupport::Concern

  included do
    attr_accessor :current_user
    helper_method :current_user, :signed_in?
    before_filter :resume_session
  end

  def signed_in?
    !!current_user
  end

  def begin_session(user)
    reset_session
    self.current_user = user
    session[:user_id] = user.id
  end

  def resume_session
    if session[:user_id].present?
      self.current_user = User.find(session[:user_id])
    end
  end

  def end_session
    session.delete(:user_id)
  end
end
