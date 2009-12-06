require File.dirname(__FILE__)+'/teststrap.rb'

context "My test application" do
  app Proc.new { [200,{"Content-Type"=>"text/html"},["okay!"]] }

  get "/" do
    asserts("is okay") { last_response.status }.equals(200)
    should("has the correct body") { last_response.body }.equals("okay!")
  end

end


context "Situation" do
  setup { Riot::Situation.new }

  asserts_topic.respond_to :last_response
  asserts_topic.respond_to :last_response
  asserts_topic.respond_to :app_file
  asserts_topic.respond_to :app_file=

  context "finding config.ru" do

    asserts("finds from within test directory") {
      Dir.chdir(File.dirname(__FILE__)) { topic.app_file }
    }.matches(/riot-rack\/config.ru/)

    asserts("from within the project directory") {
      Dir.chdir(File.join(File.dirname(__FILE__),"..")) { topic.app_file }
    }.matches(/riot-rack\/config.ru/)
  end
end

