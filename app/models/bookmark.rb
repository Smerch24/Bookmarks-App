# frozen_string_literal: true

# Managment Bookmark objects
class Bookmark < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :url_link, presence: true
end
