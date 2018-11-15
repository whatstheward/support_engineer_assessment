class CreateProgrammingLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :programming_languages do |t|
      t.string :name
      t.string :category
      t.integer :date_of_birth
      t.string :inventor

      t.timestamps
    end
  end
end
