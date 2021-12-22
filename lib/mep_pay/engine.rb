unless Rails.env.production?
  require "dotenv-rails"
  Dotenv.load('.env')
end
module MepPay
  class Engine < ::Rails::Engine
    # config.hosts << "www.example.com"
    config.autoload_paths <<  "#{root}/app/exceptions"
    config.autoload_paths <<  "#{root}/app/services"
    isolate_namespace MepPay
    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot
      g.factory_bot dir: 'spec/factories'
    end
  end
end
