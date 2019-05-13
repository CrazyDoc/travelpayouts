class Travelpayouts_page

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
    currentDate = current_time.strftime '%Y-%m-%d'
    Watir.logger.info('Search hotel by valid city name')
    @browser.input(css: '#hotels-destination-whitelabel_en').send_keys('Mo')
    @browser.li(xpath: '/html/body/div[2]/div/div/ul/li[1]').click
    Watir.logger.info('Click on check in box')
    @browser.div(css: 'div.mewtwo-hotels-dates-checkin').click
    # TODO: check how to get one day month value
    # @browser.div(css: 'td#mewtwo-datepicker-' + currentDate).click
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

  def close
    @browser.close
  end

end