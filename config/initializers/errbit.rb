Airbrake.configure do |config|
  config.api_key = '39595933c52d18b9c5ca1e2f68c5a996'
  config.host    = '122.112.89.151'
  config.port    = 3001
  config.secure  = config.port == 443
  config.development_environments = []
end
