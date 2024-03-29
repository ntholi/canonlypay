class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.float :min_price
      t.float :max_price
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.text :body
      t.string :city

      t.timestamps
    end
  end
end
