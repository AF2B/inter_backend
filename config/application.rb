require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"

Bundler.require(*Rails.groups)

module InterBackend
  class Application < Rails::Application
    config.load_defaults 7.0

    config.api_only = true
  end
end

# config.middleware.insert_before 0, Rack::Cors do
#   allow do
#     origins '*'
#     resource '*',
#       headers: :any,
#       methods: [:get, :post, :put, :delete],
#       expose: ['Authorization']
#   end
# end
