class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street_number
      t.text :route, :null => false
      t.string :locality, :null => false
      t.string :administrative_area, :null => false
      t.string :country, :null => false
      t.string :postal_code, :null => false
      t.text :coordinates

      t.references :user
    end
  end
end
