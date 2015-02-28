$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'ltree_rails'
require 'coveralls'
Coveralls.wear!

Dir['./spec/support/**/*.rb'].sort.each { |f| require f }