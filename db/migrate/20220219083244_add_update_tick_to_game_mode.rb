class AddUpdateTickToGameMode < ActiveRecord::Migration[7.0]
  def change
    add_column :game_modes, :update_tick, :integer, default: 5
  end
end
