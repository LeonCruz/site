require 'require_all'
require 'mongoid'


configure :testing do
  Mongoid.load!('config/mongoid.yml', :testing)
end


require_all 'app'