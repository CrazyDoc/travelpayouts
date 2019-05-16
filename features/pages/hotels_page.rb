class Hotels_page

  Common.get_url('prod')

  require 'watir'
  require 'page-object'
  require 'rspec/expectations'
  require 'date'

  include PageObject

  Watir.logger.level = :info

  def open_travelpayouts_page
    Watir.logger.info('Open travelpayouts main page')
    @browser.goto Common.get_url('prod')
  end

  def validate_search_form
    Watir.logger.info('Check if search form tile is displayed')
    @browser.div(css: 'div.TPWL-header-content__label').click
    @browser.goto Common.get_url('prod')
  end

  def validate_settings_menu
    Watir.logger.info('Check if settings dropdown element is dispalyed')
    @browser.div(class: 'TPWL-widget.user-settings').click
    @browser.goto Common.get_url('prod')
  end

  def validate_hotels_switcher
    Watir.logger.info('Check if switcher between flighs and hotels is displayed')
    @browser.div(css: 'ul.mewtwo-tabs_list').click
    @browser.goto Common.get_url('prod')
  end

  def validate_search_hotels_form
    Watir.logger.info('Check if search hotels form is displayed by default')
    @browser.div(css: 'div.mewtwo-hotels-container').click
    @browser.goto Common.get_url('prod')
  end

  def search_hotel
    current_time = DateTime.now
    currentDate = current_time.strftime '%Y-%_M-%d'
    Watir.logger.info('Search hotel by city name')
    @browser.input(css: '#hotels-destination-whitelabel_en').send_keys('Mo')
    @browser.li(xpath: '/html/body/div[2]/div/div/ul/li[1]').click
    Watir.logger.info('Click on check in box')
    @browser.div(css: 'div.mewtwo-hotels-dates-checkin').click
    # TODO: check how to get one day month value
    #@browser.div(css: 'td#mewtwo-datepicker-' + currentDate).click
    Watir.logger.info('Increase number of guests')
    @browser.div(css: 'div.mewtwo-hotels-guests').click
    @browser.span(xpath: '/html/body/div[2]/div/div/div[1]/div[2]/span[3]').click
    Watir.logger.info('Click on submit search')
    @browser.div(css: 'div.mewtwo-hotels-submit_button').click
  end

  def get_search_hotel_results
    Watir.logger.info('Validate search results')
    @browser.span(css: 'span.search-results-title__total').click
    sleep 30
    Watir.logger.info('Click on Book button')
    @browser.div(css: 'div.main_gate-button').click
    sleep 5
    if (browser.url == Common.get_url('prod'))
      fail
    end
  end

  def navigate_to_hotel_detailed_page
    Watir.logger.info('navigate to hotel detailed page')
    @browser.div(css: 'div.card-hotel_name').click
    @browser.window(index: 1).use
  end

  def validate_hotel_detailed_page
    Watir.logger.info('validate hotel detailed page')
    @browser.span(css: 'span.hotel_page-serp_link__link.hotel_page-serp_link__link--crumbs').click
    Watir.logger.info('Validate address displayed')
    @browser.div(css: 'div.hotel_page-info').click
    Watir.logger.info('Validate rating displayed')
    @browser.div(css: 'div.hotel_page-reviews_details').click
  end

  def click_on_parther_link
    Watir.logger.info('Click on partner price link')
    sleep 20
    @browser.a(css: 'a.card-gates_list-item-deeplink').click
    @browser.window(index: 1).use
    sleep 5
    if (browser.url == Common.get_url('prod'))
      fail
    end
  end


  def search_flight
    current_time = DateTime.now
    currentDate = current_time.strftime '%Y-%m-%d'
    Watir.logger.info(currentDate)
    Watir.logger.info('Switch to flights')
    @browser.span(xpath: '//*[@id="tpwl-main-form"]/div/div[1]/nav/ul/li[1]/span').click
    Watir.logger.info('Search origin by city name')
    @browser.input(css: 'input#flights-origin-prepop-whitelabel_en').send_keys('Moscow')
    Watir.logger.info('Click on first origin search result')
    @browser.li(css: 'li.mewtwo-autocomplete-list-item.mewtwo-autocomplete-list-item--shifted').click
    Watir.logger.info('Search destination by city name')
    @browser.input(css: 'input#flights-destination-prepop-whitelabel_en').send_keys('Paris')
    @browser.li(css: 'li.mewtwo-autocomplete-list-item').click
    Watir.logger.info('Click on depart date box')
    @browser.div(css: 'div.mewtwo-flights-dates-depart').click
    Watir.logger.info('Click on passenger box')
    @browser.div(css: '.mewtwo-flights-trip_class-wrapper.mewtwo-flights-trip_class-wrapper').click
    Watir.logger.info('Increase mumber of passengers')
    @browser.span(css: 'span.mewtwo-popup-ages-counter__plus').click
    Watir.logger.info('Click on submit search')
    @browser.div(css: 'div.mewtwo-flights-submit_button').click
  end

  def validate_search_results
    Watir.logger.info('Validate search results')
    @browser.div(css: 'div.ticket-action-button.ticket-action-button--').click
    Watir.logger.info('Validate redirect to partner site')
    @browser.window(index: 1).use
    if (browser.url == Common.get_url('prod'))
      fail
    end
  end

  def click_on_special_price_button
    sleep 10
    if ((@browser.a(xpath: '//a[contains(@href,\'searches\')]')).text).length > 0
      @browser.a(xpath: '//a[contains(@href,\'searches\')]').click
    end
    sleep 10
  end

  def change_currency
    Watir.logger.info('Select currenct')
    sleep 5
    @browser.div(css: 'div.user-settings-informer').click
    sleep 5
    currencyList = @browser.lis(css: 'li.user-settings-selector-currencies-list__item')
    currencyList[1].click
  end

  def change_language
    Watir.logger.info('Select language')
    sleep 5
    @browser.div(css: 'div.user-settings-informer').click
    sleep 5
    @browser.a(xpath: '/html/body/div[1]/div/div[2]/div[1]/div[1]/div[1]/div/div[1]/div[3]/div/div[2]/ul/li[5]/a').click
    sleep 5
    if (browser.url != 'http://whitelabel.travelpayouts.com/?locale=be')
      fail
    end
  end

  def footer_validation
    Watir.logger.info('Close cookie banner')
    @browser.button(css: 'button.policy-bar__close').click
    Watir.logger.info('Verify footer is shown')
    @browser.div(css: 'div.user-settings-informer').click
    @browser.goto Common.get_url('prod')
    Watir.logger.info('Validate copyright section')
    Watir.logger.info(@browser.div(css: 'div.TPWL-footer-content__copyright').text)
    @browser.goto Common.get_url('prod')
    Watir.logger.info('Validate terms section')
    Watir.logger.info(@browser.div(css: 'div.TPWL-footer-content__descrition').text)
  end

  def header_validation
    Watir.logger.info('Verify header is shown')
    Watir.logger.info(@browser.div(css: 'div.TPWL-header-content').text)
    Watir.logger.info('Validate logo')
    Watir.logger.info(@browser.div(css: 'div.TPWL-header-content__logo').text)
    Watir.logger.info('Validate descrition section')
    Watir.logger.info(@browser.div(css: 'div.TPWL-header-content__descrition').text)
  end
end