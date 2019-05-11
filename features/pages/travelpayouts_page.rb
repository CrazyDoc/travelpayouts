class Travelpayouts_page

  Common.get_url('prod')

  require 'watir'
  require 'page-object'
  require 'rspec/expectations'


  include PageObject

  div(:searchFormTitle, css: 'div.TPWL-header-content__label')
  div(:settingsDropdown, css: 'div.user-settings-informer')
  div(:searchConteiner, css: 'div.mewtwo-hotels-container')
  div(:searchInput, css: '#hotels-destination-whitelabel_en')
  #@searchFormTitle = rows.div(css: 'div.TPWL-header-content__label')




  def open_travelpayouts_page
    Watir.logger.info('Open travelpayouts main page')
    @browser.goto Common.get_url('prod')

  end

  def validate_search_form
    Watir.logger.info('Check if search form tile is displayed')
    #browser.div(:css => @searchFormTitle).click
   browser.div(:css => 'div.TPWL-header-content__label').click
 #   browser.div(:css => 'div.mewtwo-hotels-container').click
  #  browser.div(:css => '#hotels-destination-whitelabel_en').click


  end

  def settingsDropdownValidation
    Watir.logger.info('Check if search form tile is displayed')
    settingsDropdown # exists?
  end


  def close
    @browser.close
  end

end