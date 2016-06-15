class UserAccessTokenSupport

  attr_accessor :user


  def initialize user
    raise 'User is invalid' unless user.is_a?(User)

    self.user = user
  end

  def generate_access_token
    access = AccessGenerator.new.generate_access self.user.email

    self.user.accesses << access
    self.user.save

    access
  end

  def access_token
    @access_token ||= self.user.access_token
  end

end
