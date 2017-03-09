class AddPasswordDigestToUsersTable < ActiveRecord::Migration[5.0]
  def change
    add_column("users", 'password_digest', :string, required: true)
  end
end
