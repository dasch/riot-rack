
require 'rubygems'
require 'rake/testtask'


task :default => [:test]

Rake::TestTask.new(:test) do |test|
  test.libs    << 'test'
  test.pattern =  'test/**/*_test.rb'
  test.warning =  true
  test.verbose =  false
end

begin
  require 'yard'
  require 'yard/rake/yardoc_task'
  YARD::Rake::YardocTask.new do |t|
    extra_files = %w(MIT-LICENSE)
    t.files = ['lib/**/*.rb']
    t.options = ["--files=#{extra_files.join(',')}"]
  end
rescue LoadError
  # YARD isn't installed
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "riot-rack"
    gem.summary = "Test your Rack apps with Riot"
    gem.description = "Use the fast, expressive and concise Riot unit-testing framework to test your Rack apps with."
    gem.email = "daniel.schierbeck@gmail.com"
    gem.homepage = "http://github.com/dasch/riot-rack"
    gem.authors = ["Daniel Schierbeck"]
    gem.add_dependency 'riot'
    gem.add_dependency 'rack-test'
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end
