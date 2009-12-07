require 'rubygems'
require 'riot'
require 'rack/test'
module Riot
  module Rack
    class BodyAsserter
      def initialize(context)
        @context = context
      end
      def =~(regex)
        @context.asserts("body matches #{regex.inspect}") { last_response.body }.matches(regex)
      end
      alias_method :matches, :=~
    end
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

      def body
        BodyAsserter.new(self)
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
module Riot
  class Context
    include Riot::Rack::ContextExtensions
  end
end
Riot::Situation.instance_eval do
  include Rack::Test::Methods
  include Riot::Rack::SituationExtensions
end
