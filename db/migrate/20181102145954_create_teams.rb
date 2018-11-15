class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :floor
      t.integer :features_shipped
      t.integer :current_bugs

      t.timestamps
    end
  end
end
