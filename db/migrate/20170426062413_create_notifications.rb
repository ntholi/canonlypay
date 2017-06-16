class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.string :content
      t.string :link
      t.references :user, foreign_key: true #The user which this notification is
      # derected to
      t.boolean :read, default: false

      t.timestamps
    end
  end
end
