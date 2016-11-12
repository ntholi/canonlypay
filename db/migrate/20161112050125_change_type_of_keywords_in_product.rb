class ChangeTypeOfKeywordsInProduct < ActiveRecord::Migration[5.0]
  def change
  	change_column :product_categories, :keywords, :text
  end
end
