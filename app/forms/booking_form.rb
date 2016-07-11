class BookingForm < Reform::Form

  properties :route_id, :user_id, :schedule

  validates :route_id, :presence => true


  def set_user user
    self.user_id = user.id
  end

end
