Feature: Prerequisites
  As a student
  So that I can see prerequisites for a course
  Courses should have links to their prerequisites

  Scenario: View list of prereqs for a course
    Given the following courses exist
      | code   | name                      |
      | CPS109 | Intro to Computer Science |
      | CPS305 | Data Structures           |
    And "CPS109" is a prerequisite for "CPS305"
    When I am on the course page for "CPS109"
    Then I should see "CPS305" is a prerequisite
