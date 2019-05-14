@hotels
Feature: Search hotel

  Background:
    Given user opens travelpayouts page
    And user search hotels page is displayed with valid content
    And user search for hotel in hotels search form

  Scenario: Search for hotel
    Then the user is redirected to partner page after clicking on book button

  Scenario: Open hotel detailed page
    When user clicks on hotel name for the first suggested hotel
    Then the page with hotel details is displayed with valid content
    And user closes travelpayouts page

  Scenario: Book hotel from selected provider
    Then user is redirected to partner side after click on partner price link suggested hotel