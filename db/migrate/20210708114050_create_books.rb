class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.belongs_to :author
      t.integer :year
      t.integer :loan_period
      t.integer :quantity

      t.timestamps
    end
  end
end
