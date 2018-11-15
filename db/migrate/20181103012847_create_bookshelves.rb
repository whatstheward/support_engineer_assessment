class CreateBookshelves < ActiveRecord::Migration[5.2]
  def change
    create_table :bookshelves do |t|
      t.integer :rating
      t.integer :times_read

      t.references :engineer, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
