class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.date :join_date
      t.string :name
      t.string :current_location
      t.string :profile_pic
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
