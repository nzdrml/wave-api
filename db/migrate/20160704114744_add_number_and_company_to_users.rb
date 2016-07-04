class AddNumberAndCompanyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone, :string, :null => false, :default => ''
    add_column :users, :company, :string, :null => false, :default => ''
  end
end
