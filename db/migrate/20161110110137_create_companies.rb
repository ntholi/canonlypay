class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :location
      t.string :phone_number
      t.string :website
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
