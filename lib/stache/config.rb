module Stache
  # Change these defaults in, say, an initializer.
  #
  # Stache.template_base_path = Rails.root.join('app', 'templates')
  #
  # Or with the block syntax:
  #
  # Stache.configure do |config|
  #   config.template_base_path = Rails.root.join('app', 'views', 'shared')
  #
  #   use :mustache # or :handlebars
  # end
  module Config
    attr_accessor :template_base_path, :view_base_path, :shared_path, :template_extension

    def configure
      yield self
    end


    def template_base_path
      @template_base_path ||= ::Rails.root.join('app', 'templates')
    end

    def template_base_path= path
      @template_base_path = Pathname.new(path)
    end

    def default_view_class
      @default_view_class ||= 'Stache::Mustache::View'
    end

    def default_view_class= classname
      @default_view_class = classname
    end

    def shared_path
      @shared_path ||= ::Rails.root.join('app', 'templates', 'shared')
    end

    def template_extension
      case @use
      when :handlebars
        @template_extension ||= :hbs
      else #:mustache
        @template_extension ||= :mustache
      end
    end

    def template_extension= extension
      @template_extension = extension
    end

    def use template_engine
      @use = template_engine
      require "stache/#{template_engine}"
    end
  end
end