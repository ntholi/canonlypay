class CreateAdverts < ActiveRecord::Migration[5.0]
  def change
    create_table :adverts do |t|
      t.references :advertiser, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
