class AddConfirmedAtToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :activated_at, :datetime
  end
end
