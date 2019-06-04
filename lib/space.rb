class Space
  include DataMapper::Resource

  property :id,          Serial
  property :name,        String,  required: true
  property :description, Text,    required: true
  property :price,       Integer, required: true
  property :checkin,     Date,    required: true
  property :checkout,    Date,    required: true
  property :userid,      Serial

  # belongs_to :user
end
