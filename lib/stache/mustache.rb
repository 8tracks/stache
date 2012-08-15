require "stache/mustache/handler"

module Stache
  module Mustache; end
end

ActionView::Template.register_template_handler Stache.template_extension, Stache::Mustache::Handler