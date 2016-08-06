class UsersController < BaseController

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

  def set_preferred_point
    point = Point.find_by_id params[:point_id]
    user = User.find_by_id params[:id]

    if point && user && params[:type].present?
      user.send "preferred_#{params[:type]}_point=", point
      head :ok
    else
      render(
        :json => {
          :message => 'Point or User does not exist'
        },
        :status => :unprocessable_entity
      )
    end

  end

end
