class AddOwnerToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :owner, :boolean, default: false
    add_column :users, :name, :string
  end
end
