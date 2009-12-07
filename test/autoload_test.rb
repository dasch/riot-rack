require File.dirname(__FILE__)+"/teststrap.rb"

context "Autoloading" do

  context "from the test directory" do
    setup do
      Dir.chdir(File.dirname(__FILE__))
    end

    get "/" do
      asserts('works') { last_response.body }.equals("yo!")
    end

  end

  context "from the project root directory" do
    setup do
      Dir.chdir(File.join(File.dirname(__FILE__)+"/.."))
    end
    
    get "/" do
      should("work") { last_response.body }.equals('yo!')
    end
  end

end
