class CreateEngineerProgrammingLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :engineer_programming_languages do |t|
      t.integer :proficency
      t.integer :repositories

      t.references :engineer, foreign_key: true
      t.references :programming_language, foreign_key: true

      t.timestamps
    end
  end
end
