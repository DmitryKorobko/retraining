# frozen_string_literal: true

class CreateBooksToGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :books_genres do |t|
      t.belongs_to :book
      t.belongs_to :genre

      t.timestamps
    end
  end
end
