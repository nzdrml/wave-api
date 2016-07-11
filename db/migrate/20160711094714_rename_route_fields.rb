class RenameRouteFields < ActiveRecord::Migration

  def self.up
    rename_column :routes, :schedule, :time
  end

  def self.down
    rename_table :routes, :time, :schedule
  end

end
