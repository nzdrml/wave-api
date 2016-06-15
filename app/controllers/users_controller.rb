class UsersController < ApplicationController

  skip_before_action :authenticate_user_from_token!

  def index
    render :json => User.all
  end

  def show
    render :json => User.find(params[:id])
  end

  def create
    form = SignupForm.new User.new

    if form.validate params[:user]
      form.save

      render :json => form.model
    else
      render(
        :json => {:message => form.errors}, :status => :unprocessable_entity
      )
    end
  end

end
