class RoutesController < BaseController

  skip_before_action :authenticate_user_from_token!


  def index
    render :json => Route.all
  end

  def show
    render :json => Route.find(params[:id])
  end

  def create
    form = RouteForm.new Route.new

    if form.validate params[:route]
      form.save

      render :json => form.model, :serializer => SessionSerializer
    else
      render(
        :json => {:message => form.errors}, :status => :unprocessable_entity
      )
    end
  end

end
