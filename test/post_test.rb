require 'sinatra'
class TestApp < Sinatra::Base
  get "/" do
    "index"
  end

  post "/" do
    "posted index"
  end

end

context "TestApp" do
  app TestApp

  get "/" do
    body=~ /index/
    body.matches /index/
  end


end
class CallCounterApp
  class << self
    attr_accessor :call_count
    def call(env)
      @call_count = 0 unless @call_count
      @call_count += 1
      [200,{"Content-Type"=>"text/html"},['hi']]
    end
  end
end

require 'stringio'
context "Posting" do
  setup do
    reporter = Riot::DotMatrixReporter.new(StringIO.new)
    Riot::Context.new('whatever') do
      post '/' do
        asserts('nothing really') { 1 + 1 }.equals(2)
      end
    end.run(reporter)
  end
  asserts('post counter was called') { CallCounterApp.call_count }.equals(1)
end

context "BodyAsserter" do
  setup do
    a_context = Riot::Context.new('whatever') do
      app TestApp
      get "/" do
        body=~ /index/
        body.matches /index/
        body=~ /no/
        body.matches /no/
      end
    end
    reporter = Riot::DotMatrixReporter.new(StringIO.new)
    a_context.run(reporter)
    reporter
  end
  asserts('two passed') { topic.passes }.equals(2)
  asserts('two failed') { topic.failures }.equals(2)
end

