if defined?(HoneyBadger)
  HoneyBadger.configure do |config|
    config.api_key = ENV["HONEYBADGER_API_KEY"]
  end
end