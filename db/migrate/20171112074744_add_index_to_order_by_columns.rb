class AddIndexToOrderByColumns < ActiveRecord::Migration[5.1]
  def change
    add_index :tags, :name, unique: true
    add_index :tags, [:name, :bookmark_counts]
  end
end
