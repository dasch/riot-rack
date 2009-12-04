require File.dirname(__FILE__)+'/teststrap.rb'

context "My test application" do
  app OkayApp

  get "/" do
    asserts("is okay") { last_response.status }.equals(200)
    should("has the correct body") { last_response.body }.equals("okay!")
  end
  
end


context "Situation" do
  setup { Riot::Situation.new }
  asserts_topic.respond_to :last_response
  asserts_topic.respond_to :last_request
end

