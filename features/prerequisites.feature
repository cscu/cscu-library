Feature: Prerequisites
  As a student
  So that I can see prerequisites for a course
  Courses should have links to their prerequisites

  Background:
    Given the following courses exist
      | code   | name                      |
      | CPS109 | Intro to Computer Science |
      | CPS305 | Data Structures           |
    And "CPS109" is a prerequisite for "CPS305"

  Scenario: View list of prereqs for a course
    When I am on the course page for "CPS305"
    Then I should see "CPS109"

  Scenario: Follow link to prerequisite
    When I am on the course page for "CPS305"
    And I follow "CPS109"
    Then I should be on the course page for "CPS109"
