Feature: Comments
    As a Hacker News reader
    I want to be able to add a comment
    So that I can contribute to the discussion

@comment
Scenario: User logged in, but cancels comment form
    Given the app is running
    When I touch "Profile"
    Then I wait to see "Login"
    Then I fill in "Username" with "monfresh"
    Then I touch "Password"
    Then I fill in "Password" with "pourqu01combien?"
    Then I touch done
    Then I wait to see "Logout"
    Then I touch "Home"
    Then I touch list item number 1
    Then I touch "reply"
    Then I touch "Cancel"
    Then I should see "Submission"

@search
Scenario: search test
    Given the app is running
    Then I touch "Search"
    Then I touch "Search Hacker News"
    Then I fill in "Search Hacker News" with "twitter"
    #Then I enter "twitter" into text field number 1
    Then I touch search 
