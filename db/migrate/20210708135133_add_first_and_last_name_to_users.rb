# frozen_string_literal: true

class AddFirstAndLastNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
