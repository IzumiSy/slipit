class RemoveTagCountsFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :tag_counts
  end
end
