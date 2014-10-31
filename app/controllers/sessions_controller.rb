class SessionsController < ApplicationController

  def index
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    session[:oauth_token] = auth["credentials"]["token"]
    session[:oauth_token_secret] = auth["credentials"]["secret"]
    session[:username] = auth.extra.access_token.params[:screen_name]
    redirect_to messages_path, notice => "Signed in!"
  end

  def destroy
    session.delete(:user_id)
    session.delete(:oauth_token)
    session.delete(:oauth_token_secret)
    session.delete(:username)
    redirect_to root_url, notice => "Signed out!"
  end
end
