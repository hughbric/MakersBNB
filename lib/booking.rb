class Booking
  include DataMapper::Resource

  property :id,           Serial
  property :arrival,      Date,     required: true
  property :departure,    Date,     required: true
  property :confirmed,    Boolean

  belongs_to :space
  belongs_to :user

end
