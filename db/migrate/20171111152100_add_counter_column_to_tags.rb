class AddCounterColumnToTags < ActiveRecord::Migration[5.1]
  def change
    add_column :tags, :bookmark_counts, :integer
  end
end
