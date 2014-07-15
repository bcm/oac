class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, :resume_session, only: :create

  def create
    user = User.find_or_create_from_auth_hash!(auth_hash)
    begin_session(user)
    redirect_to(root_path)
  end

  def destroy
    end_session
    redirect_to(root_path)
  end

protected
  def auth_hash
    request.env['omniauth.auth']
  end
end
