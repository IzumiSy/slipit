Resque.redis = Redis.new(url: ENV['REDIS_URL'])
Resque.after_fork = proc do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  ActiveRecord::Base.establish_connection
end
