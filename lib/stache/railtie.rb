module Stache
  class Railtie < ::Rails::Railtie
    initializer 'stache.autoload', :before => :set_autoload_paths do |app|
      app.config.autoload_paths << Rails.root + Stache.view_base_path
    end

    config.to_prepare do
      ApplicationController.send(:append_view_path, Stache.template_base_path)
    end
  end
end
