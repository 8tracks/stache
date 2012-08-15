require "stache/handlebars/handler"

module Stache
  module Handlebars; end
end

ActionView::Template.register_template_handler Stache.template_extension, Stache::Handlebars::Handler