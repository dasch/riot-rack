
$:.unshift(File.dirname(__FILE__) + "/../lib/")

require 'rubygems'
require 'riot'
require 'riot/rack'


context "A Rack app" do
  app { lambda { [200, {}, "Hello, World!"] } }

  context "on a GET" do
    setup { get '/' }
    asserts(:status).equals(200)
    asserts(:body).equals("Hello, World!")
  end
end
