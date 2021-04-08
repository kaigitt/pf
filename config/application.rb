require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Musicrows
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # wheneverを使う用
    config.autoload_paths += Dir["#{config.root}/lib"]

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    # Rspecファイル自動作成用
    config.generators do |g|
      g.test_framework :rspec
    end

    # rack-attack用
    config.middleware.use Rack::Attack
  end
end