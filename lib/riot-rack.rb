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

      def self.find_configru
        if Dir.glob("config.ru").length > 0
          File.join(Dir.pwd,"config.ru")
        else
          Dir.chdir("..") do
            find_configru
          end
        end
      end

      #the default behavior is to look for
      #a config.ru file starting with current
      #directory and working our way back
      def app
        app_file = Riot::Rack::SituationExtensions.find_configru
        ::Rack::Builder.new {
          contents = ::File.readlines(app_file).join("\n")
          instance_eval(contents)
        }.to_app
      end
    end
  end
end

Riot::Context.instance_eval { include Riot::Rack::ContextExtensions }
Riot::Situation.instance_eval do
  include Rack::Test::Methods
  include Riot::Rack::SituationExtensions
end
