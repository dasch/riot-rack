
require 'rack'
require 'rack/test'


module Riot::Rack
  module SituationHelpers
    include Rack::Test::Methods

    # The Rack app under test.
    def app
      defined?(@app) ? @app : build_app
    end

    private

    def build_app
      config_file = File.read(find_config_file)
      Rack::Builder.new { instance_eval(config_file) }.to_app
    end

    def find_config_file
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
