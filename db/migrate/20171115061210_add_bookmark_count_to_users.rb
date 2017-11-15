class AddBookmarkCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :bookmark_counts, :integer, null: false, default: 0
  end
end
