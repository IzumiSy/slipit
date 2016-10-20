class AddTitleDescriptionBookmark < ActiveRecord::Migration
  def change
    add_column :bookmarks, :title, :string
    add_column :bookmarks, :description, :string
  end
end
