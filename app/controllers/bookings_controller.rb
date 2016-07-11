class BookingsController < BaseController

  skip_before_action :authenticate_user_from_token!, :only => [:index, :show]


  def index
    render :json => Booking.all
  end

  def user_bookings
    render :json => current_user.bookings
  end

  def show
    render :json => Booking.find(params[:id])
  end

  def create
    form = BookingForm.new Booking.new

    if form.validate params[:booking]
      form.set_user current_user
      form.save

      render :json => form.model
    else
      render(
        :json => {:message => form.errors}, :status => :unprocessable_entity
      )
    end
  end

end
