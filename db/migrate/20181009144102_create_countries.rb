class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :capital
      t.string :region
      t.integer :population
      t.integer :area

      t.timestamps
    end
  end
end
