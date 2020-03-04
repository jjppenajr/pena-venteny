class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password)
    @email = (email || "").downcase
    @password = password
    @account = User.find_by(email: email)
  end

  def call
    return [JsonWebToken.encode(user_id: user[:id]), user] if user
  end

private

  attr_accessor :email, :password, :account

  def user
    return blank_credentials if email.blank? || password.blank?
    return invalid_credentials if account.blank?
    return login_user if account.valid_password?(password)
    return invalid_credentials
  end

  def blank_credentials
    errors.add :base, "Please enter username/password."
    return nil
  end

  def invalid_credentials
    errors.add :base, "Invalid Credentials."
    return nil
  end

  def login_user
    return account
  end
end