class RemoveUserAndLocationReferencesFromPost < ActiveRecord::Migration[5.1]
  def change
    change_table :posts do |t|
      t.remove_references :users, foreign_key: true
      t.remove_references :locations, foreign_key: true
    end
  end
end
