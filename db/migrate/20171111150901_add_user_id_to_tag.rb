class AddUserIdToTag < ActiveRecord::Migration[5.1]
  def change
    add_column :tags, :user_id, :integer
  end
end
