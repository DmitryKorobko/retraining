# frozen_string_literal: true

class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.datetime :date_of_birth
      t.datetime :date_of_death

      t.timestamps
    end
  end
end
