class AddColumnsToAgent < ActiveRecord::Migration[6.1]
  def change
    add_column :agents, :website, :string
    add_column :agents, :twitter, :string
    add_column :agents, :instagram, :string
    add_column :agents, :facebook, :string
    add_column :agents, :phone, :string
    add_column :agents, :mobile, :string
    add_column :agents, :address, :string
  end
end
