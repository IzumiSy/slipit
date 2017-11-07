class AddTitleDescriptionBookmark < ActiveRecord::Migration[5.1]
  def change
    add_column :bookmarks, :title, :string
    add_column :bookmarks, :description, :string
  end
end
