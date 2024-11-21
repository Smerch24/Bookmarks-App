# frozen_string_literal: true

class AddLabelToBookmarks < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookmarks, :label, foreign_key: true
  end
end
