# frozen_string_literal: true

# Management Lable
class Label < ApplicationRecord
  validates :name, presence: true
end
