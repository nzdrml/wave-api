class BookingForm < Reform::Form

  properties :origin_id, :destination_id, :user, :schedule

  validates :origin_id, :destination_id, :schedule, :presence => true


  def set_user user
    self.user = user
  end

end
