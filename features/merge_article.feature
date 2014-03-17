Feature: Write Articles
  As a blogger
  In order to remove redundant articles
  I want to be able to merge similar articles

  Background:
    Given the blog is set up
    And 2 similar articles, each with a new blogger and 1 comment:
      | id | title    | body        | blogger  | comment  |
      | 2  | test1    | test1111    | ger1     | com1     |
      | 3  | test2    | test2222    | ger2     | com2     |

  Scenario: Users are able to visit the 1st article view
    Given I am on the home page
    When I follow "test1"
    Then I should see "test1111"

  Scenario: Admin can merge two articles
    Given I am logged into the admin panel
    When I go to the edit page of article #2
    And I fill in "merge_with" with "3"
    And I press "Merge"
    Then I should see "Merge"
    When I go to the home page
    Then I should see "test1" or "test2"
    When I go to the view page of article #4
    Then I should see "test1111" and "test2222"

  Scenario: The target of merge with should be verified

  Scenario: A non-admin cannot merge articles

  Scenario: The merged article should contain the text of both

  Scenario: The merged article should have either one of the original author
    
  Scenario: Comments should point to the new merged article

  Scenario: The merged article should have either one of the original title


