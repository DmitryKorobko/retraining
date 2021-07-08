class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :book, foreign_key: true
      t.datetime :period
      t.boolean :activity, default: true

      t.timestamps
    end
  end
end
