class TweetsController < ApplicationController
  before_action :twitter_client, except: :new
  def twitter_client
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ""
      config.consumer_secret     = ""
      config.access_token        = ""
      config.access_token_secret = ""
    end
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(create_params)
    redirect_to :root
  end

  def post
    tweet = Tweet.order("RANDOM()").limit(1).first
    # tweet = Tweet.last
    status = tweet.text
    # media = open(tweet.image)
    # @client.update_with_media(status, media)
    @client.update(status)
    redirect_to :root
  end

  private
  def create_params
    params.require(:tweet).permit(:text, :image)
  end
end
