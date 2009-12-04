# Riot-Rack

## usage

    require 'rubygems'
    require 'riot-rack'
    context "My application" do
      app = Proc.new { [200,{"Content-Type"=>"text/html"},["okay!"]] }
      get "/"
        asserts("okay") { last_request.status }.equals(200)
        asserts("correct body") { last_request.body }.equals("okay!")
      end
    end
