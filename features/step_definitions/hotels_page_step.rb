require_relative '../pages/hotels_page.rb'

Given("user opens travelpayouts page") do
  @travelpayouts_page = Hotels_page.new(@browser)
  @travelpayouts_page.open_travelpayouts_page
end

Given("user search hotels page is displayed with valid content") do
  @travelpayouts_page.validate_search_form
  @travelpayouts_page.validate_search_hotels_form
end

Given(/^user search for hotel in hotels search form$/) do
  @travelpayouts_page.search_hotel
end

Given(/^the user is redirected to partner page after clicking on book button$/) do
  @travelpayouts_page.get_search_hotel_results
end

Then(/^user clicks on hotel name for the first suggested hotel$/) do
  @travelpayouts_page.navigate_to_hotel_detailed_page
end

Then(/^the page with hotel details is displayed with valid content$/) do
  @travelpayouts_page.validate_hotel_detailed_page
end

Then(/^user is redirected to partner side after click on partner price link suggested hotel$/) do
  @travelpayouts_page.click_on_parther_link
end

Then(/^user can search for flight in flights search form$/) do
  @travelpayouts_page.search_flight
  @travelpayouts_page.validate_search_results
end

Then(/^user can click on special price link from flights search results$/) do
  @travelpayouts_page.search_flight
  @travelpayouts_page.click_on_special_price_button
end

Then(/^user can change the currency value$/) do
  @travelpayouts_page.change_currency
end

Then(/^user can change the language value$/) do
  @travelpayouts_page.change_language
end

Then(/^footer is displayed with valid content$/) do
  @travelpayouts_page.footer_validation
end

Then(/^header is displayed with valid content/) do
  @travelpayouts_page.header_validation
end