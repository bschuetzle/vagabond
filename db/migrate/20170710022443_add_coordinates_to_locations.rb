class AddCoordinatesToLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :coordinates, :string, array: true, default: '{}'
  end
end
