require 'data_mapper'
require 'dm-postgres-adapter'

class User

  include DataMapper::Resource

  property :id,          Serial
  property :email,       String, :required => true, :unique => true
  property :password,    String, :required => true

end
