require File.dirname(__FILE__)+'/teststrap.rb'

context "My test application" do
  app Proc.new { [200,{"Content-Type"=>"text/html"},["okay!"]] }

  get "/" do
    asserts("is okay") { last_response.status }.equals(200)
    should("has the correct body") { last_response.body }.equals("okay!")
  end

end

context "Auto-loading" do
  get "/" do
    asserts("is okay") { last_response.status }.equals(200)
    asserts("has the correct body") { last_response.body }.equals("yo")
  end
end

context "Situation" do
  setup { Riot::Situation.new }
  asserts_topic.respond_to :last_response
  asserts_topic.respond_to :last_request
end

