require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'
require_relative 'space'
require_relative 'user'
require_relative 'booking'

if ENV['RACK_ENV'] == 'test'
  # DataMapper::Logger.new(STDOUT, :debug)
  DataMapper.setup(
    :default, 'postgres://:@localhost/makersbnb_test'
  )
else
  DataMapper.setup(
    :default, 'postgres://:@localhost/makersbnb'
  )
end

DataMapper.finalize
DataMapper.auto_upgrade!
