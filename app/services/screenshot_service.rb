# frozen_string_literal: true

class ScreenshotService
  def self.capture(url, output_path)
    Puppeteer.launch do |browser|
      page = browser.new_page
      page.goto(url, wait_until: 'networkidle0')
      page.screenshot(path: output_path.to_s)
    end
  end
end
