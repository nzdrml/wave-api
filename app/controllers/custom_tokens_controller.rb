class CustomTokensController < Doorkeeper::TokensController

  include AbstractController::Callbacks

  before_action :allow_cross_origin_requests


  def allow_cross_origin_requests
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization, X-Authorization'
    headers['Access-Control-Max-Age'] = '1728000'
  end

end
