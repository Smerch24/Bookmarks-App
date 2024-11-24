# frozen_string_literal: true

class AddUserIdToLabels < ActiveRecord::Migration[7.1]
  def change
    add_reference :labels, :user, foreign_key: true
  end
end
