class CreateProductCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :product_categories do |t|
      t.string :category
      t.text :keywords

      t.timestamps
    end
  end
end
