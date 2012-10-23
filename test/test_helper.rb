require 'simplecov'
SimpleCov.start

require 'iridium/ember'

require 'minitest/unit'
require 'minitest/autorun'

Dir[File.expand_path('../support/**/*.rb', __FILE__)].each do |file|
  require file
end
