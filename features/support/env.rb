TEST_DATA_DIR = "./features/support/test_data"
$: << File.dirname(__FILE__) + '/../../lib'

require 'watir'
require 'page-object'

Before do
  args = %w[headless disable-gpu disable-dev-shm-usage disable-software-rasterizer no-sandbox]
  @browser = Watir::Browser.new :chrome, args: args
end

After do |scenario|
  begin
    if scenario.failed?
      Dir::mkdir('screenshots') if not File.directory?('screenshots')
      screenshot = "./screenshots/FAILED_#{scenario.name.gsub(' ', '_').gsub(/[^0-9A-Za-z_]/, '')}.png"
      @browser.driver.save_screenshot(screenshot)
      embed screenshot, 'image/png'
    end
  ensure
    @browser.close
  end
end
