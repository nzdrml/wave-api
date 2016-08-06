class AddressesController < BaseController

  skip_before_action :authenticate_user_from_token!

  def index
    render :json => Address.all
  end

  def show
    render :json => Address.find(params[:id])
  end

  def create
    form = AddressForm.new Address.new

    if form.validate params[:address]
      form.save

      if User.exists?(params[:user_id]) &&
         Address::TYPES.include?(params[:type])
         
        user = user.find params[:user_id]
        user.send "#{params[:type]}_address=", form.model
      end

      render :json => form.model
    else
      render(
        :json => {:message => form.errors}, :status => :unprocessable_entity
      )
    end
  end

end
