require File.dirname(__FILE__)+"/teststrap.rb"

require 'stringio'
require 'fakefs'

context "Autoloading" do
  #set up fake filesystem
  setup do

    Dir.chdir("/")
    Dir.mkdir("project")
    Dir.mkdir("project/first")
    Dir.mkdir("project/first/test")
    File.open("/project/first/config.ru","w+") do |file|
      file.puts "app = Proc.new { [200, {'Content-Type'=>'text/html'}, ['yo!']] } "
      file.puts "run app"
    end
  end

  context "from the test directory" do
    setup {
      Dir.chdir("/project/first/test")
    }

    asserts "finds the config.ru file" do
      Riot::Rack::SituationExtensions.find_configru
    end.equals("/project/first/config.ru")


    get "/" do
      should("work") { last_response }
      asserts('body') { last_response.body }.equals("yo!")
    end

  end

  context "from the project root directory" do
    setup {
      Dir.chdir("/")
      Dir.chdir("/project/first")
    }
    
    get "/" do
      asserts("file found") { Riot::Rack::SituationExtensions.find_configru }.equals("/project/first/config.ru")
      should("work") { last_response.body }.equals('yo!')
    end
  end

end
