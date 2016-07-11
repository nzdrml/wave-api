class RenameBookingToRoute < ActiveRecord::Migration

  def self.up
    rename_table :bookings, :routes
  end

  def self.down
    rename_table :routes, :bookings
  end
  
end
