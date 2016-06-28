class BaseController < ApplicationController

  before_action :authenticate_user_from_token!

  skip_before_action :authenticate_user_from_token!, :only => [:preflight]
  skip_before_action :doorkeeper_authorize!, :only => [:preflight]


  def preflight
    render nothing: true
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
