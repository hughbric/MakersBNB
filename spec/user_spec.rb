describe User do
  describe ".authenticate" do
    it "verifies email with database" do
      database_user = User.create(email: "john@makers.com", password: "password")
      login_user = User.authenticate(email: "john@makers.com", password: "password")
      expect(login_user.id).to eq database_user.id
      expect(login_user).to be_a User
    end
    it "returns nil if password is invalid" do
      database_user = User.create(email: "john@makers.com", password: "password")
      login_user = User.authenticate(email: "john@makers.com", password: "invalidpassword")
      expect(login_user).to be_nil
    end
    it "returns nil if email does not exist" do
      database_user = User.create(email: "john@makers.com", password: "password")
      login_user = User.authenticate(email: "notexistant@makers.com", password: "password")
      expect(login_user).to be_nil
    end

  end

end
