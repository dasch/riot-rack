$:.unshift(File.dirname(__FILE__)+"/../lib")
require 'riot-rack'

class OkayApp
  def self.call(env); [200,{"Content-Type"=>"text/html"},["okay!"]]; end
end
