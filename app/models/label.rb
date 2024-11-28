# frozen_string_literal: true

# Management Lable
class Label < ApplicationRecord
  validates :name, presence: true, length: { maximum: 16 }
  has_many :bookmarks, dependent: :destroy

  scope :by_user, ->(user_id) { where(user_id: user_id) }
  scope :order_by_name, -> { order('LENGTH(name) DESC') }
end
