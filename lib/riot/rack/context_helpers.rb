
module Riot::Rack
  module ContextHelpers
    # Set the Rack app which is to be tested.
    #
    #   context "MyApp" do
    #     app { [200, {}, "Hello!"] }
    #     setup { get '/' }
    #     asserts(:status).equals(200)
    #   end
    def app(app=nil, &block)
      setup { @app = (app || block) }
    end
  end
end
