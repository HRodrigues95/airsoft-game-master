class CreateGameModes < ActiveRecord::Migration[7.0]
  def change
    create_table :game_modes, id: :uuid  do |t|
      t.string :name
      t.integer :total_points
      t.integer :total_locations
      t.jsonb :configuration

      t.timestamps
    end
  end
end
