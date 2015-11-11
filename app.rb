require "bundler/setup"
require "sinatra"
require "sinatra/reloader"
require 'redis'
require 'dotenv'
Dotenv.load

class DeployApp < Sinatra::Base

  get '/*' do
    content_type 'text/html'

    prefix    = "#{ENV['APP_NAME']}:index"
    redis     = Redis.new host: ENV['REDIS_HOST'], \
      port: ENV['REDIS_PORT'], password: ENV['REDIS_SECRET']
    index_key = redis.get("#{prefix}:current")
    if params[:index_key]
      index_key = "#{params[:index_key]}"
    end
    redis.get("#{prefix}:#{index_key}")
  end

end
