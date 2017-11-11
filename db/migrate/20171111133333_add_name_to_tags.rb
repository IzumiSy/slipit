class AddNameToTags < ActiveRecord::Migration[5.1]
  def change
    add_column :tags, :name, :string
  end
end
