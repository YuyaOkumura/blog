require 'redis'
require 'redis-objects'
Redis.current = Redis.new(host: ENV["REDIS_HOST"], port: 6379)
