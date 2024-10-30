class CreateBookmarks < ActiveRecord::Migration[7.1]
  def change
    create_table :bookmarks do |t|
      t.string :title
      t.text :description
      t.text :url_link
      t.timestamps
    end
  end
end
