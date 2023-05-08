class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :website, :string
    add_column :users, :twitter, :string
    add_column :users, :instagram, :string
    add_column :users, :facebook, :string
    add_column :users, :phone, :string
    add_column :users, :mobile, :string
    add_column :users, :address, :string
  end
end
