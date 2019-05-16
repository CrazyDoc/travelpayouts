@user_settings
Feature: User settings

  Background:
    Given user opens travelpayouts page

  Scenario: Change currency
    Then user can change the currency value

  Scenario: Change language
    Then user can change the language value
