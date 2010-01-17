
require File.dirname(__FILE__) + "/teststrap"


Dir.chdir "test" do
  context "Not specifying an app" do
    setup { get '/' }

    asserts(:status).equals(200)
    asserts(:body).equals("Hello, World!")
  end
end
