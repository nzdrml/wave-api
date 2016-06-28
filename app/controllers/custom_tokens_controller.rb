class CustomTokensController < Doorkeeper::TokensController

  include AbstractController::Callbacks

  before_action :allow_cross_origin_requests


  def allow_cross_origin_requests
    puts 'Setting headers.'
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

end
