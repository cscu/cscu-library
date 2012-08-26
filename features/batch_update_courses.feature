Feature: Quickly add courses from Ryerson calendar
  As the maintainer of CSCU Library
  So that I can quickly update all the courses
  I should be able to copy course information from Ryerson's calendar
  Background:
    Given I am logged in

  Scenario: Adding courses
    Given I am on the courses batch update page
    When I fill in "Ryerson Calendar URL" with "http://www.ryerson.ca/calendar/2012-2013/pg3173.html"
    And I press "Batch Update"
    Then I should be on the confirm batch update page
    And I should see "Found 58 new courses"
