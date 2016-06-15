class ApplicationController < ActionController::API

  include ActionController::Serialization


  before_action :allow_cross_origin_requests

  before_action :doorkeeper_authorize!


  def allow_cross_origin_requests
    self.allowed_origin

    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    headers['Access-Control-Max-Age'] = '1728000'
  end

  def allowed_origin
    if self.development_origin?
      headers['Access-Control-Allow-Origin'] = request.headers['Origin']
    end
  end

  # Checks the origin of the client and assigns to request header.
  # Allow localhost:3000 as origin
  def development_origin?
    !!(/\Ahttp:\/\/localhost:3000\z/ =~ request.headers['Origin']) && Rails.env.development?
  end

  def index
    render :json => 'Welcome'
  end

end
