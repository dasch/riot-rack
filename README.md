# Riot::Rack

Use [Riot](http://github.com/thumblemonks/riot/) to test your [Rack](http://rack.rubyforge.org/)
apps easily!

Here's the gist of it:

```ruby
require 'riot'
require 'riot/rack'

context "HelloWorldApp" do
# Specify your app using the #app helper. If you don't specify
# one, Riot::Rack will recursively look for a config.ru file.
# Takes either an app class or a block argument.
app {|env| [200, {}, "Hello, World!"] }

# Alternatively:
  app(HelloWorldApp)

# You can use all the Rack::Test helpers in the setup blocks.
setup { get '/' }

# You can access the response directly.
asserts(:status).equals(200)
asserts(:body).equals("Hello, World!")
end
```

## Installation

Add Gemcutter to your gem sources:

    sudo gem sources -a http://gemcutter.org

Then, simply install the riot-rack gem like so:

    sudo gem install riot-rack


## Prerequisites

- [Riot](http://github.com/thumblemonks/riot)
- [Rack::Test](http://github.com/brynary/rack-test)


## License

Copyright (c) 2010 Daniel Schierbeck, Brian Carlson.

Riot is released under the MIT license. See {file:MIT-LICENSE}.
