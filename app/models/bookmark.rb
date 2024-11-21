# frozen_string_literal: true

# Management Bookmark objects
class Bookmark < ApplicationRecord
  belongs_to :user
  has_one :label
  after_create :generate_screenshot
  after_update :generate_screenshot, if: :saved_change_to_url_link?

  validates :title, presence: true
  validates :url_link, presence: true
  validates :description, length: { maximum: 33 }

  private

  def generate_screenshot
    screenshot_filename = "#{id}_#{Time.now.strftime('%Y%m%d%H%M%S')}.png"
    screenshot_path = Rails.root.join('public', 'screenshots', screenshot_filename)
    ScreenshotService.capture(url_link, screenshot_path)
    update_column(:screenshot, "/screenshots/#{screenshot_filename}")
  end
end
