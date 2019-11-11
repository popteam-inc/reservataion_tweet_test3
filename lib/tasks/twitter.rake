namespace :twitter do
  task :tweet => :environment do
    twitter_client
    tweet = Tweet.order("RANDOM()").limit(1).first
    # tweet = Tweet.last
    # binding.pry
    status = tweet.text
    # media = open(tweet.image)
    # @client.update_with_media(status, media)
    @client.update(status)
  end
end

def twitter_client
  @client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ""
    config.consumer_secret     = ""
    config.access_token        = ""
    config.access_token_secret = ""
  end
end