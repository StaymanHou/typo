Feature: Write Articles
  As a blog administrator
  In order to remove redundant articles
  I want to be able to merge similar articles

  Background:
    Given the blog is set up
    And 2 similar articles, each with a new blogger and 1 comment:
      | id | title    | body        | blogger  | comment  |
      | 3  | test1    | test1111    | ger1     | com1     |
      | 4  | test2    | test2222    | ger2     | com2     |

  Scenario: Users should see Hello World
    Given I am on the home page
    Then I should see "Hello World"    

  Scenario: Users are able to visit the 1st article view
    Given I am on the home page
    When I follow "test1"
    Then I should see "test1111"

  Scenario: Admin can merge two articles
    Given I am logged into the admin panel
    When I go to the edit page of article #3
    And I fill in "merge_with" with "4"
    And I press "Merge"
    Then I should see "Merge Succeeded"
    When I go to the home page
    Then I should see "test1"
    When I go to the edit page of article #3
    Then I should see "test1111" and "test2222"

  Scenario: The target of merge with should be verified

  Scenario: A non-admin cannot merge articles

  Scenario: The merged article should contain the text of both

  Scenario: The merged article should have either one of the original author
    
  Scenario: Comments should point to the new merged article

  Scenario: The merged article should have either one of the original title


