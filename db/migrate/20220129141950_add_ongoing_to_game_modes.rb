class AddOngoingToGameModes < ActiveRecord::Migration[7.0]
  def change
    add_column :game_modes, :ongoing, :boolean, default: false
  end
end
