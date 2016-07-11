class DropUserColumnFromRoutes < ActiveRecord::Migration

  def self.up
    remove_reference :routes, :user
  end

  def self.down
    add_reference :routes, :user
  end

end
