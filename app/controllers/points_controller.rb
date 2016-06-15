class PointsController < ApplicationController

  skip_before_action :authenticate_user_from_token!

  def index
    render :json => Point.all
  end

  def show
    render :json => Point.find(params[:id])
  end

  def create
    form = PointForm.new Point.new

    if form.validate params[:point]
      form.save

      render :json => form.model
    else
      render(
        :json => {:message => form.errors}, :status => :unprocessable_entity
      )
    end
  end

end
