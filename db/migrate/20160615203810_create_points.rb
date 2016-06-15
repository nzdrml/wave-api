class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.string :name, :null => false
      t.text :coordinates
    end
  end
end
