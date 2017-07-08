class RemovePhotoFromLocations < ActiveRecord::Migration[5.1]
  def change
    remove_column :locations, :photo, :string
  end
end
