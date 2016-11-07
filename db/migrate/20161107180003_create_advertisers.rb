class CreateAdvertisers < ActiveRecord::Migration[5.0]
  def change
    create_table :advertisers do |t|
      t.string :first_name
      t.string :second_name
      t.string :email
      t.string :company_name
      t.string :city
      t.string :phone_number
      t.string :website

      t.timestamps
    end
  end
end
