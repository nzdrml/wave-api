class BaseController < ApplicationController

  before_action :allow_cross_origin_requests
  before_action :authenticate_user_from_token!

  skip_before_action :authenticate_user_from_token!, :only => [:preflight]
  skip_before_action :doorkeeper_authorize!, :only => [:preflight]


  def preflight
    render nothing: true
  end

  def allow_cross_origin_requests
    raise 'boom'
    self.allowed_origin

    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    headers['Access-Control-Max-Age'] = '1728000'
  end

  def allowed_origin
    if self.production_origin? || self.development_origin?
      headers['Access-Control-Allow-Origin'] = request.headers['Origin']
    end
  end

  def production_origin?
    !!(/\Ahttp:\/\/128.199.232.120\z/ =~ request.headers['Origin']) && Rails.env.production?
  end

  def development_origin?
    !!(/\Ahttp:\/\/localhost:3000\z/ =~ request.headers['Origin']) && Rails.env.development?
  end

  def authenticate_user_from_token!
    return authentication_error if self.token_authenticator.invalid?

    sign_in self.token_authenticator.user, :store => false
  end



  protected

  def token_authenticator
    @token_authenticator ||=
      TokenAuthenticator.new request.headers['X-Authorization']
  end

  ##
  # Authentication Failure
  # Renders a 401 error
  def authentication_error
    # User's token is either invalid or not in the right format
    render :json => {:message => 'Unauthorized. Please log in to proceed.'},
      :status => :unauthorized  # Authentication timeout
  end

end
