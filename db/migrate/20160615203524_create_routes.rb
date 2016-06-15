class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.references :origin, :null => false, :index => true
      t.references :destination, :null => false, :index => true
    end
  end
end
