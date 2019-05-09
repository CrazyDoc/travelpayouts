require 'watir'

require 'page-object'

Before do

  @browser = Watir::Browser.new :chrome, headless: true
  @browser.window.maximize

end