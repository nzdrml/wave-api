class CreatePointUsers < ActiveRecord::Migration
  def change
    create_table :point_users do |t|
      t.references :point, :index => true, :null => false
      t.references :user, :index => true, :null => false
      t.integer :point_type, :null => false
    end
  end
end
