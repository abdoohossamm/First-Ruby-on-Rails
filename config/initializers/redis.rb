require 'redis'

if ENV.fetch('REDIS_URL')
  redis_url = ENV.fetch('REDIS_URL')
else
  redis_config = YAML.load_file(Rails.root.join('config', 'redis.yml'))[Rails.env]
  redis_url = "redis://#{redis_config['host']}:#{redis_config['port']}/#{redis_config['db']}"
end

$redis_cache_connection = Redis.new(url: redis_url)