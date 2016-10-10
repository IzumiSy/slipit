class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|

      t.timestamps null: false
    end
  end
end
