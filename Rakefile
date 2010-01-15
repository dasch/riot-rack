
require 'rubygems'
require 'rack'


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
