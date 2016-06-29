class SessionsController < BaseController
  
  before_action :allow_cross_origin_requests

  skip_before_action :authenticate_user_from_token!,
    :only => [:create, :destroy]


  def create
    return self.invalid_login_attempt if self.user_authenticator.invalid?

    sign_in self.user_authenticator.user, :store => false

    user_session_support = UserSessionSupport.new self.user_authenticator.user
    user_session_support.create_session

    render :json => user_session_support.access,
      :serializer => SessionSerializer,
      :root => nil
  end

  def destroy
    if self.token_authenticator.valid?
      self.token_authenticator.access.delete
    end

    render :json => {:success => true}
  end

  def allow_cross_origin_requests
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    headers['Access-Control-Max-Age'] = '1728000'
  end


  protected

  def user_authenticator
    @user_authenticator ||= UserAuthenticator.new params
  end

  def invalid_login_attempt
    warden.custom_failure!

    render :json => {:message => 'Invalid Username or Password.'},
      :status => :unauthorized
  end

end
