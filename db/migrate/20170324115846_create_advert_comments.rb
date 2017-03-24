class CreateAdvertComments < ActiveRecord::Migration[5.0]
  def change
    create_table :advert_comments do |t|
      t.references :user, foreign_key: true
      t.text :comment
      t.references :advert, foreign_key: true

      t.timestamps
    end
  end
end
