require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    config.load_defaults 6.0
    config.api_only = true
    config.debug_exception_response_format = :default
    config.autoload_paths += %W(#{config.root}/services)
  end
end
