require 'byebug'
require 'mongoid'
require 'require_all'

require_all 'app'

configure :testing do
  Mongoid.load!('config/mongoid.yml', :testing)
end
