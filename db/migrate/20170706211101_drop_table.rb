class DropTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :user_locations
  end
end