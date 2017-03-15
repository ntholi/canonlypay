class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.references :product_category, foreign_key: true
      t.float :price, default: 0
      t.integer :year_made
      t.text :description
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
