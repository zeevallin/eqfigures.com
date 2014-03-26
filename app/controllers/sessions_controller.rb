class SessionsController < ApplicationController

  def new
    redirect_to '/auth/twitter'
  end

  def create
    auth = request.env["omniauth.auth"]

    user = User.where(provider: auth['provider'], uid: auth['uid'].to_s).first
    user ||= User.create_with_omniauth(auth)
    user.apply_omniauth_info(auth)
    user.save

    reset_session

    session[:user_id] = user.id
    redirect_to root_path, :notice => 'Signed in!'
  end

  def destroy
    reset_session
    redirect_to root_path, :notice => 'Signed out!'
  end

  def failure
    redirect_to root_path, :alert => "Authentication error: #{params[:message].humanize}"
  end

end
