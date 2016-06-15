class CreateAccesses < ActiveRecord::Migration
  def change
    create_table :accesses do |t|
      t.string :access_token, :null => false
      t.string :remember_token, :null => false

      t.references :user, :null => false
      t.timestamps :null => false
    end
  end
end
