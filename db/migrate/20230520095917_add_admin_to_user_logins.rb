class AddAdminToUserLogins < ActiveRecord::Migration[7.0]
  def change
    add_column :user_logins, :admin, :boolean
  end
end
