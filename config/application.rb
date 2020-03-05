# frozen_string_literal: true

require_relative 'boot'

require 'rails'
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
# require "action_cable/engine"
require 'sprockets/railtie'
# require "rails/test_unit/railtie"
Bundler.require(*Rails.groups)

module VaicarImageUploader
  class Application < Rails::Application
    config.load_defaults 5.2
    config.generators.system_tests = nil

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.i18n.enforce_available_locales = false
    config.i18n.default_locale = :'en'

    config.generators do |generator|
      generator.test_framework :rspec, fixture: false
      generator.javascripts false
      generator.helper false
      generator.view_specs false
      generator.helper_specs false
      generator.controller_specs true
      generator.model_specs true
      generator.fixtures false
      generator.stylesheets false
      generator.decorator_specs false
      generator.decorator false
    end
  end
end
