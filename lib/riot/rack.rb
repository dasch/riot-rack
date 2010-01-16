
require 'riot'
require 'riot/rack/context_helpers'
require 'riot/rack/situation_helpers'


class Riot::Situation
  include Riot::Rack::SituationHelpers
end

class Riot::Context
  include Riot::Rack::ContextHelpers
end
