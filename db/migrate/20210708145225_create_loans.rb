# frozen_string_literal: true

class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.belongs_to :user
      t.belongs_to :book
      t.datetime :period

      t.timestamps
    end
  end
end
