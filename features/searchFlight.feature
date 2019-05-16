@flights
Feature: Search flight

  Background:
    Given user opens travelpayouts page

  Scenario: Search for flight
    And user can search for flight in flights search form

  Scenario: Click on special price
    And user can click on special price link from flights search results
