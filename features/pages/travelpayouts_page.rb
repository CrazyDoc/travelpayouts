class Travelpayouts_page


  include PageObject

  div(:searchFormTitle, css: 'div.TPWL-header-content__label')

  def open_travelpayouts_page
    Watir.logger.info('Open travelpayouts main page')
    @browser.goto 'http://whitelabel.travelpayouts.com/'
  end

  def validate_main_elements
    Watir.logger.info('Check if search form tile is displayed')
    @browser.searchFormTitle.exists?
  end

  def close
    @browser.close
  end

end