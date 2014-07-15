class SessionsController < ApplicationController
  skip_before_action :resume_session, :verify_authenticity_token, only: :create

  respond_to :json, only: :create

  def new
    redirect_to(root_path) if signed_in?
  end

  def create
    user = User.find_or_create_from_auth_hash!(auth_hash)
    begin_session(user)
    render json: {status: 'success'}
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
