class User
  include DataMapper::Resource

  property :id,          Serial
  property :email,       String, :required => true, :unique => true, :format => :email_address, :messages => {
    :presence => "We need your email address please.",
    :is_unique => "We already have that email address.",
    :format => "Doesn't look like an email address to me!"
  }
  property :password,    String, :required => true
  # attr_accessor :password_confirmation

  # validates_confirmation_of :password


  def self.authenticate(email:, password:)
    allUsersWithEmail = all(email: email)
    return nil if allUsersWithEmail.length != 1
    user = allUsersWithEmail.first
    return nil unless user.password == password
    user
  end
end
