get '/' do

  erb :index
end

get '/:username' do
  # binding.pry
  @username = params[:username]
  @tweets = []
  if user = local_user?(params[:username]) # Checks whether a user is in the DB
    puts "=================== User found in DB ============================"
    user.tweets.limit(10).each do |tweet|
      @tweets << tweet.text
    end
    @tweets
  else

    puts "=================== User not in DB ============================"
    # user = get_user_timeline_tweets(params[:username])
    # redirect("/error") if user.nil?
    # Come back to change the error page!!!!!!!!!!!!!!!!!!!!!!
    if user_timeline = get_user_timeline_tweets(params[:username]) # Checks whether user exists in Twitterverse
      puts "=================== User is in Twitterverse ============================"
      user = TwitterUser.create(username: params[:username])
      user_timeline.each do |tweet|
        user.tweets.create(text: tweet.text)
        @tweets << tweet.text
      end
      @tweets
    else
      puts "=================== User not in Twitterverse ============================"
    end

  end

  erb :index
end

post '/get_user_tweets' do
  redirect("/#{params[:username]}")
end

get '/error' do
  erb :error
end

 # $client.user_timeline.each do |tweet| p "#{tweet.text}" end

# .new
# .build
# .create

def get_user_timeline_tweets(params)
  $client.user_timeline(params)
end

def local_user?(params)
  TwitterUser.find_by_username(params)
end
