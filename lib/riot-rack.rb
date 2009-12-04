require 'rubygems'
require 'riot'
require 'rack/test'
module Riot
  module Rack
    module ContextMacros
      def app(app)
        setup do
          @app = app
          def app; @app; end
        end
      end
      
      def get(url,&context_definition)
        context(url,&context_definition).last.setup do
          get url
        end
      end
      
    end
  end
end

Riot::Context.instance_eval { include Riot::Rack::ContextMacros }
Riot::Situation.instance_eval { include Rack::Test::Methods }
