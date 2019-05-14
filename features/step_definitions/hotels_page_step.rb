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

Then(/^user search for flight in flights search form$/) do
  @travelpayouts_page.search_flight
end




Then(/^user closes travelpayouts page$/) do
  @travelpayouts_page.close
end
