class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :city
      t.string :state
      t.string :region
      t.string :photo
      t.decimal :lat
      t.decimal :long

      t.timestamps
    end
  end
end
