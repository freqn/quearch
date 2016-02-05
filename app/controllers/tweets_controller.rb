class TweetsController < ApplicationController

  def index
    params[:q] = 'ruby on rails' if params[:q].blank?
    # @reddit_query = params[:q].gsub(/\s/,"+")
    # @fetch_reddit = RedditScraper.new.fetch_reddit_headlines(params[:q])
    # @fetch_hn = HnScraper.new.fetch_hn_headlines(params[:q])
    @client = TwitterClient.client
    get_tweets
  end

  def get_tweets
    # params[:q] = 'ruby on rails' if params[:q].blank?

    # @tweet_query = params[:q].gsub(/\s/,"%20").downcase
    @tweets = []
    @client.search(params[:q]).take(50).each do |tweet|
        @tweets << tweet.text
    end
  end
end
