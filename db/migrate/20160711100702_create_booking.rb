class CreateBooking < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :route, :null => false, :index => true
      t.references :user, :null => false, :index => true
      t.datetime :schedule, :null => false
    end
  end
end
