require 'redis'
require 'redis-objects'

Redis.current = Redis.new(url: ENV["REDIS"])
