class ChangeDatetimeToTimeForRoute < ActiveRecord::Migration

  def self.up
    remove_column :routes, :time
    add_column :routes, :time, :time, :null => false, :default => '0:00:00'
  end

  def self.down
    remove_column :routes, :time
    add_column :routes, :time, :datetime
  end

end
