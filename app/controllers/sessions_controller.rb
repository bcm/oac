class SessionsController < ApplicationController
  skip_before_action :resume_session, :verify_authenticity_token, only: :create

  def new
    redirect_to(root_path) if signed_in?
  end

  def create
    oauth = request.env['omniauth.auth']
    if oauth.info.email.blank?
      flash[:danger] = "Facebook said you didn't give us permission to access your e-mail address. That is literally the only piece of information we need from them in order to get you set up. Please contact us at #{view_context.mail_to Rails.configuration.email.to.help} to see if we can work something out."
      return redirect_to(sign_in_path)
    end
    user = User.find_or_create_from_oauth!(oauth)
    begin_session(user)
    redirect_to(root_path)
  end

  def failure
    flash[:danger] = "Facebook said your signin failed because: <em>#{params[:message]}</em>. Try again? If it continues to not work, please tell us at #{view_context.mail_to Rails.configuration.email.to.help}."
    redirect_to(sign_in_path)
  end

  def destroy
    end_session
    redirect_to(root_path)
  end
end
