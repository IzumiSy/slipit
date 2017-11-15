class AddRegistrationTokenToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :activation_token, :string
  end
end
