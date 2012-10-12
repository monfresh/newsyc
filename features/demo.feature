Feature: Comments
    As a Hacker News reader
    I want to be able to add a comment
    So that I can contribute to the discussion

@demo
Scenario: User logged in, but cancels comment form
    Given I am logged in
    When I go to comment on a submission
    But I cancel the comment form
    Then I should see the submission
    And a comment from "klausjensen" should not appear

@tap
Scenario: Tap each cell
	And I tap each cell