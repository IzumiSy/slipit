class AddUserIdToBookmark < ActiveRecord::Migration[5.1]
  def change
    add_column :bookmarks, :user_id, :string
  end
end
