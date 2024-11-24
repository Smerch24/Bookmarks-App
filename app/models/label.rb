# frozen_string_literal: true

# Management Lable
class Label < ApplicationRecord
  validates :name, presence: true, length: { maximum: 16 }
  has_many :bookmarks, dependent: :destroy
end
