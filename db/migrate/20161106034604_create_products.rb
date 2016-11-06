class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :category
      t.string :name
      t.float :price
      t.integer :year_made
      t.text :description
      t.text :pictures
      t.references :advertiser, foreign_key: true

      t.timestamps
    end
  end
end
