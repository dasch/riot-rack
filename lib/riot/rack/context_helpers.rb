
module Riot::Rack
  module ContextHelpers
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
end
