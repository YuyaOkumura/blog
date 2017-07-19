require 'redis'
require 'redis-objects'
uri = URI.parse(ENV["REDIS"])
Redis.current = Redis.new(host: uri.host, port: uri.port)
