class CreatePostComments < ActiveRecord::Migration[5.0]
  def change
    create_table :post_comments do |t|
      t.user :references
      t.text :comment
      t.post :references

      t.timestamps
    end
  end
end
