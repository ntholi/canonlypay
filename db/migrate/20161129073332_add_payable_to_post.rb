class AddPayableToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :payable, :boolean, default: false
  end
end
