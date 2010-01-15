
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
