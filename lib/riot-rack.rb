require 'rubygems'
require 'riot'
require 'rack/test'
module Riot
  module Rack
    module ContextExtensions
      def app(application)
        setup do
          @app = application
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
        file = app_file
        ::Rack::Builder.new {
          contents = ::File.readlines(file).join("\n")
          instance_eval(contents)
        }.to_app
      end

      def app_file
        @app_file || find_app_file
      end

      def app_file=(file)
        @app_file = file
      end

      private
      def find_app_file
        if Dir.glob("config.ru").length > 0
          File.join(Dir.pwd,"config.ru")
        elsif Dir.pwd != "/"
          Dir.chdir("..") { find_app_file }
        else
          raise "Cannot find config.ru"
        end
      end
    end
  end
end

Riot::Context.instance_eval { include Riot::Rack::ContextExtensions }
Riot::Situation.instance_eval do
  include Rack::Test::Methods
  include Riot::Rack::SituationExtensions
end
