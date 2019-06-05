class User
  include DataMapper::Resource

  property :id,          Serial
  property :email,       String, :required => true, :unique => true, :format => :email_address
  property :password,    String, :required => true

  def self.authenticate(email:, password:)
    allUsersWithEmail = all(email: email)
    return nil if allUsersWithEmail.length != 1
    user = allUsersWithEmail.first
    return nil unless user.password == password
    user
  end
end
