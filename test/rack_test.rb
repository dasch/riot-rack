
require File.dirname(__FILE__) + "/teststrap"


context "A Rack app" do
  app { [200, {}, "Hello, World!"] }

  context "serving a GET request to '/'" do
    setup { get '/' }
    asserts(:status).equals(200)
    asserts(:body).equals("Hello, World!")
  end
end
