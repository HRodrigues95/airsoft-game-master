class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations, id: :uuid do |t|
      t.string :name
      t.integer :points
      t.references :game_mode, null: false, foreign_key: true, type: :uuid
      t.references :team, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
