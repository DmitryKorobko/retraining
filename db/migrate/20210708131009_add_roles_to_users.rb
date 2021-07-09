class AddRolesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :librarian_role, :boolean, default: false
    add_column :users, :customer_role, :boolean, default: true
  end
end
