require "bundler/setup"
require "sinatra"
require "sinatra/reloader"
require 'redis'
require 'dotenv'
Dotenv.load

get '/' do
  content_type 'text/html'

  redis = Redis.new(url: ENV['REDIS_URL'])
  index_key = redis.get("#{ENV['APP_NAME']}:index:current")
  if params[:index_key]
    index_key = "#{params[:index_key]}"
  end
  redis.get("#{ENV['APP_NAME']}:index:#{index_key}")
end
