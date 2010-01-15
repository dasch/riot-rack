
require 'riot'
require 'rack/test'


class Riot::Situation
  include Rack::Test::Methods

  # The Rack app under test.
  attr_reader :app
end


class Riot::Context
  # Set the Rack app which is to be tested.
  #
  #   context "MyApp" do
  #     app { MyApp }
  #     setup { get '/' }
  #     asserts(:status).equals(200)
  #   end
  def app(&block)
    setup { @app = block.call }
  end
end
