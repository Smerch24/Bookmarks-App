# frozen_string_literal: true

# Managment Bookmark objects
class Bookmark < ApplicationRecord
  belongs_to :user
  after_create :generate_screenshot

  validates :title, presence: true
  validates :url_link, presence: true

  private

  # Метод для генерации скриншота
  def generate_screenshot
    screenshot_path = Rails.root.join('public', 'screenshots', "#{id}.png")

    # Используем url_link для передачи ссылки в сервис
    ScreenshotService.capture(url_link, screenshot_path)

    # Сохраняем путь к скриншоту в базе данных
    update(screenshot: "/screenshots/#{id}.png")
  end
end
