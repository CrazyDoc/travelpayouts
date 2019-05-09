require_relative '../pages/travelpayouts_page.rb'


Given("user opens travelpayouts page") do


  @travelpayouts_page = Travelpayouts_page.new(@browser)


  @travelpayouts_page.open_travelpayouts_page


end




Then(/^user closes travelpayouts page$/) do

  @travelpayouts_page.close


end