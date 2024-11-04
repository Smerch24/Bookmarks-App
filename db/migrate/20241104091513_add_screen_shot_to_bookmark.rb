# frozen_string_literal: true

# Add a screenshot column to Bookmark model
class AddScreenShotToBookmark < ActiveRecord::Migration[7.1]
  def change
    add_column :bookmarks, :screenshot, :string
  end
end
