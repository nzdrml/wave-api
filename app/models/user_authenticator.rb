class UserAuthenticator

  def initialize params
    @login = params[:email]
    @password = params[:password]
  end

  def valid?
    return false unless self.user

    self.user.valid_password? @password
  end

  def invalid?
    !self.valid?
  end

  def user
    @user ||= User.find_for_database_authentication :login => @login
  end

end
