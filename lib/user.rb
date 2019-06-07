class User
  include DataMapper::Resource

  property :id,          Serial
  property :email,       String,  :required => true,
                                  :unique => true,
                                  :format => :email_address
  property :password,    String, :required => true

  has n, :spaces
  has n, :bookings

  def self.authenticate(email:, password:)
    all_users_with_email = all(email: email)
    return nil if all_users_with_email.length != 1
    user = all_users_with_email.first
    return nil unless user.password == password
    user
  end
end
