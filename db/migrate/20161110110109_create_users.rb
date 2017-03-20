class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :display_name
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :location
      t.date :birthday
      t.string :phone_number

      t.timestamps
    end
  end
end
