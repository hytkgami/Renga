class MessagesController < ApplicationController

  def index
    if signed_in?
      twitter_client = Twitter::REST::Client.new do |config|
        config.consumer_key = ENV['TWITTER_KEY']
        config.consumer_secret = ENV['TWITTER_SECRET']
        config.access_token = session[:oauth_token]
        config.access_token_secret = session[:oauth_token_secret]
      end
      @user = twitter_client.user
      @timeline = twitter_client.home_timeline
      @result = :success
    else
      @result = :not_signed_in
    end
  end

  def create
    if signed_in?
      twitter_client = Twitter::REST::Client.new do |config|
        config.consumer_key = ENV['TWITTER_KEY']
        config.consumer_secret = ENV['TWITTER_SECRET']
        config.access_token = session[:oauth_token]
        config.access_token_secret = session[:oauth_token_secret]
      end

      twitter_client.update(params[:message])
      @result = :success
      redirect_to messages_path
    else
      @result = :not_signed_in
    end
  end

end
