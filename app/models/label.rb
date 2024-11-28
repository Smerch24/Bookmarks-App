# frozen_string_literal: true

# Management Lable
class Label < ApplicationRecord
  validates :name, presence: true, length: { maximum: 16 }
  has_many :bookmarks, dependent: :destroy

  scope :current_user, -> { where(user_id: current_user.id) }
  scope :current_label, -> { where(label_id: label.id) }
  scope :order_by_name, -> { order('LENGTH(name) DESC') }
end
