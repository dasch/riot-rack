
require 'rack/test'


module Riot::Rack
  module SituationHelpers
    include Rack::Test::Methods

    # The Rack app under test.
    def app
      @app || build_app
    end
  end
end
