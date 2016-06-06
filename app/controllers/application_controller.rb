class ApplicationController < ActionController::API

  include ActionController::Serialization


  def index
    render :json => 'Welcome'
  end

end
