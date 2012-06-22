Feature: Finding a course
  As a student
  So that I can find documents for my course
  I should be able to find my course

  Background: Existing courses
    Given the following courses exist
      | code   | name                      |
      | CPS109 | Intro to Computer Science |
      | CPS305 | Data Structures           |

  Scenario: Select course from list
    Given I am on the courses page
    When I follow "CPS109"
    Then I should be on the course page for "CPS109"

  Scenario: Search for course from homepage
    Given I am on the home page
    When I search for "CPS109"
    Then I should be on the course page for "CPS109"

  Scenario: Search for course from courses
    Given I am on the courses page
    When I search for "CPS109"
    Then I should be on the course page for "CPS109"

  Scenario: Search for course from course
    Given I am on the course page for "CPS305"
    When I search for "CPS109"
    Then I should be on the course page for "CPS109"

  Scenario: Search for invalid course from homepage
    Given I am on the home page
    When I search for "Computer Science I"
    Then I should be on the courses page
