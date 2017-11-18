class AddTagCountsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :tag_counts, :integer, null: false, default: 0
  end
end
