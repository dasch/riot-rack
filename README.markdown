# Riot-Rack

Provides a test DSL on top of 
[rack-test](http://github.com/brynary/rack-test) and
[riot](http://github.com/thumblemonks/riot) to make testing rack based
applications dead simple.

## Installation

Make sure you have the [gemcutter](http://www.gemcutter.org) gem
installed

    sudo gem install riot-rack 

## Usage

    require 'rubygems'
    require 'riot-rack'
    context "My application" do
      app Proc.new { [200,{"Content-Type"=>"text/html"},["okay!"]] }
      get "/"
        asserts("okay") { last_request.status }.equals(200)
        asserts("correct body") { last_request.body }.equals("okay!")
      end
    end

## Autoloading of the application file

Riot-rack adds an "app" method to the body of your context. Setting
the app will define the appropriate app method for rack/test
compatibility.  

If you do not set the app manually, riot-rack will
look in directories upwards starting from Dir.pwd until it finds a
config.ru file.  If the file is found, it will evaluate this file and
use it as your rack/test application.


