class AddLocationsToTeams < ActiveRecord::Migration[7.0]
  def change
    add_reference :teams, :locations, foreign_key: true, type: :uuid
  end
end
