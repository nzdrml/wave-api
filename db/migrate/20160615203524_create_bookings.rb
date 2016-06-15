class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :origin, :null => false, :index => true
      t.references :destination, :null => false, :index => true
      t.references :user, :null => false, :index => true
      t.datetime :schedule, :null => false
    end
  end
end
