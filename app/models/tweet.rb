class Tweet < ActiveRecord::Base
  belongs_to :twitter_user

  def average_tweet_time
    last_tweet_time - TwitterUser.first.tweets[2].twitter_time
    # (Twitter.counUser.first.tweets.reduce(:+)) / TwitterUser.first.tweets.length
    # Use AR .sum feature?
  end

  def tweets_stale?
    inactive_time_from_last_tweet > average_tweet_time ? true : false
  end

  def last_tweet_time
    TwitterUser.first.tweets[1].twitter_time
  end

  def inactive_time_from_last_tweet
    # This returns the elapsed time between
    # user's last tweet until now
    Time.now - last_tweet_time
  end
end
