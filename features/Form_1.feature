Feature: Submit Form Feature

  Scenario: As any user I can submit a form
    Given I am on website
    When I enter my username as "maxwell"
    And I enter message as "Test Message"
    And I click on submit button
    Then I see "Success"

  Scenario: As any user I cannot submit a form without entering my username
    Given I am on website
    When I enter message as "Test Message"
    And I click on submit button
    Then I see a username validation error


  Scenario: As any user I cannot submit a form without entering my message
    Given I am on website
    When I enter my username as "maxwell"
    And I click on submit button
    Then I see a message validation error

  Scenario: As any user I cannot submit a form without captcha 
    Given I am on website
    When I enter my username as "maxwell"
    And I enter message as "Test Message"
    And I submit without captcha
    Then I should see a captcha validation error