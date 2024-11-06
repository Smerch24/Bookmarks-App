class AddUserIdToBookmark < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookmarks, :user, foreign_key: true
  end
end
