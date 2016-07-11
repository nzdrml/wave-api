class AddPriceColumnToRoute < ActiveRecord::Migration
  def change
    add_column :routes, :price, :decimal, :precision => 8, :scale => 2,
               :default => 0
  end
end
