class CreateEngineers < ActiveRecord::Migration[5.2]
  def change
    create_table :engineers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :email

      t.references :country, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps

    end
  end
end
