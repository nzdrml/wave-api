class TokenAuthenticator

  def initialize auth_token
    @auth_token = auth_token
  end

  def valid?
    return false if @auth_token.nil? || self.user.nil?

    self.access.present?
  end

  def invalid?
    !self.valid?
  end

  def user
    @user ||= User.where(:email => self.email).first
  end

  def access
    @access ||= Access.where(:access_token => @auth_token).first
  end



  protected

  def email
    return nil if @auth_token.nil?

    @email ||= @auth_token.split(TokenGenerator::DELIMITER).first
  end

end
