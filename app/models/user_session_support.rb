class UserSessionSupport

  attr_accessor :user, :access


  def initialize user
    raise 'User is invalid' unless user.is_a?(User)

    self.user = user
  end

  def create_session
    self.access = self.user_access_token_support.generate_access_token
  end



  protected

  def user_access_token_support
    @user_access_token_support ||=
      UserAccessTokenSupport.new self.user
  end

end
