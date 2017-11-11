class CreateBookmarkTags < ActiveRecord::Migration[5.1]
  def change
    create_table :bookmark_tags do |t|
      t.integer :tag_id
      t.integer :bookmark_id

      t.timestamps
    end
  end
end
