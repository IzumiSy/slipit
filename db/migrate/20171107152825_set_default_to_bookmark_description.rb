class SetDefaultToBookmarkDescription < ActiveRecord::Migration[5.1]
  def change
    change_column :bookmarks, :title, :string, null: false
    change_column :bookmarks, :url, :string, null: false
    change_column :bookmarks, :description, :string, null: false, default: ""
  end
end
