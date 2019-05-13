require_relative '../pages/travelpayouts_page.rb'

Given("user opens travelpayouts page") do
  @travelpayouts_page = Travelpayouts_page.new(@browser)
  @travelpayouts_page.open_travelpayouts_page
end

Given("search hotels page is displayed with valid content") do
  @travelpayouts_page.validate_search_form
 # @travelpayouts_page.validate_settings_menu
 # @travelpayouts_page.validate_hotels_switcher
  @travelpayouts_page.validate_search_hotels_form
end

Given("user search for Moscow city in search hotels form") do
  @travelpayouts_page.search_hotel
end

Given("the user is redirected to partner page after clicking on book button") do
  @travelpayouts_page.get_search_hotel_results
end

Then(/^user closes travelpayouts page$/) do
  @travelpayouts_page.close
end