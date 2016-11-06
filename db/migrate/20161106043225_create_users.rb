class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :second_name
      t.string :email
      t.string :city
      t.string :phone_number

      t.timestamps
    end
  end
end
