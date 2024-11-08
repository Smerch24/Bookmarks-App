# frozen_string_literal: true

# Management Bookmark objects
class Bookmark < ApplicationRecord
  belongs_to :user
  after_create :generate_screenshot
  after_update :generate_screenshot, if: :saved_change_to_url_link?

  validates :title, presence: true
  validates :url_link, presence: true

  private

  def generate_screenshot
    screenshot_path = Rails.root.join('public', 'screenshots', "#{id}.png")
    ScreenshotService.capture(url_link, screenshot_path)
    update_column(:screenshot, "/screenshots/#{id}.png")
  end
end
