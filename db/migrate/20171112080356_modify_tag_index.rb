class ModifyTagIndex < ActiveRecord::Migration[5.1]
  def change
    remove_index :tags, [:name, :bookmark_counts]
    add_index :tags, :bookmark_counts
  end
end
