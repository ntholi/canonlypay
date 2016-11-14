class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.references :product_category, foreign_key: true
      t.float :price
      t.integer :year_made
      t.text :description
      t.references :advertiser, foreign_key: true

      t.timestamps
    end
  end
end
