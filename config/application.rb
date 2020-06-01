require_relative 'boot'

require 'json'
require 'open-uri'
require 'romkan'
require 'line/bot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Webapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.generators do |g|
      g.test_framework :rspec,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false
    end

    config.time_zone = 'Asia/Tokyo'

    # production環境でのlibディレクトリの読み込みを設定
    config.paths.add 'lib', eager_load: true

    # キューイングバックエンドを設定
    config.active_job.queue_adapter = :sidekiq
  end
end
