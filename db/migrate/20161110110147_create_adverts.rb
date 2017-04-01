class CreateAdverts < ActiveRecord::Migration[5.0]
  def change
    create_table :adverts do |t|
      t.references :company, foreign_key: true
      t.references :product, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
