class AuthenticateApiRequest
  prepend SimpleCommand

  def initialize(headers = {})
    @headers = headers
  end

  def call
    auth
  end

  private

  attr_reader :headers

  def auth
    if decoded_auth_token
      return user if decoded_auth_token[:user_id].present?
    end
    return errors.add(:message, 'Invalid token') && nil
  end

  def user
    return User.find(decoded_auth_token[:user_id])
  end

  def decoded_auth_token
    JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    else
      errors.add :token, 'Missing token'
    end

    return nil
  end
end