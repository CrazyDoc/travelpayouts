require_relative '../pages/travelpayouts_page.rb'


Given("user opens travelpayouts page") do
  @travelpayouts_page = Travelpayouts_page.new(@browser)
  @travelpayouts_page.open_travelpayouts_page
end

Given("search hotels form is displayed with valid content") do
  @travelpayouts_page.validate_search_form
end

Given("user settings dropdown is displayed") do
  @travelpayouts_page.settingsDropdownValidation
end


Then(/^user closes travelpayouts page$/) do
  @travelpayouts_page.close
end