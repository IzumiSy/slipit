require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SlipIt
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Middlewares
    config.middleware.use Rack::Deflater

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Settings for Clearance
    config.to_prepare do
      Clearance::SessionsController.layout 'login'
      Clearance::UsersController.layout 'login'
      Clearance::PasswordsController.layout 'login'
    end

    # Disable field_with_errors
    config.action_view.field_error_proc = proc do
      %(html_tag.to_s).html_safe
    end

    # Add lib/guards
    config.autoload_paths << Rails.root.join("lib/guards")
  end
end
