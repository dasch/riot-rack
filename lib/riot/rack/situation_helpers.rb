
require 'rack/test'


module Riot::Rack
  module SituationHelpers
    include Rack::Test::Methods

    # The Rack app under test.
    attr_reader :app
  end
end
