class AddTagCountsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :tag_coutns, :integer, null: false, default: 0
  end
end
