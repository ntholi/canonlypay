class CreateProductCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :product_categories do |t|
      t.string :category
      t.string :keywords

      t.timestamps
    end
  end
end
