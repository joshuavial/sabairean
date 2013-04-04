Feature: viewing index
  As a student
  I want to view the chapters available
  So I can choose what I want to learn

  Scenario: visit home
    Given I am on the home page
    Then I should see "Happy Learning" in ".title"

  Scenario: choose Khmer language
    Given I am on the home page
    And I click on link "Khmer"
    Then I should see "សប្បាយរៀន" in ".title"

