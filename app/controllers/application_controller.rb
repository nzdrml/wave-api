class ApplicationController < ActionController::API

  before_action :doorkeeper_authorize!

  include ActionController::Serialization

end
