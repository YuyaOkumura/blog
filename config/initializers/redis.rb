require 'redis'

p "host: #{ENV["REDIS_HOST"]}, port: #{ENV["REDIS_PORT"]}"

REDIS = Redis.new(host: ENV["REDIS_HOST"], port: ENV["REDIS_PORT"])
