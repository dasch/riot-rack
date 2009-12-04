require 'rubygems'
require 'riot'
require 'rack/test'
module Riot
  module Rack
    module ContextExtensions
      def app(app)
        setup do
          @app = app
          def app; @app; end
        end
      end
      
      def get(uri,&context_definition)
        context("get #{uri}",&context_definition).last.setup do
          get uri
        end
      end
      
    end
    module SituationExtensions
      #the default behavior is to look for
      #a config.ru file starting with current
      #directory and working our way back
      def app
        raise "You must define an app"
      end
    end
  end
end

Riot::Context.instance_eval { include Riot::Rack::ContextExtensions }
Riot::Situation.instance_eval do
  include Rack::Test::Methods 
  include Riot::Rack::SituationExtensions
end
