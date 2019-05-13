Feature: Open main page


  Scenario: Open main page
    Given user opens travelpayouts page
    Then search hotels page is displayed with valid content
    And user closes travelpayouts page

  Scenario: Search for hotel
    Given user opens travelpayouts page
    And user search for Moscow city in search hotels form
    And the user is redirected to partner page after clicking on book button
    And user closes travelpayouts page