Feature: Blip with a #XX issue submitted
  In order to know what issue is worked on
  As a wave user
  I want githubot to replace issue # with issue title
  
  Scenario: Add an issue to wavelet
    Given I've chosen "githubot" -> "testrepo"
    And I type "issue #1"
    When I trigger a "blip_with_issue" event
    Then I should see "issue \[This is a test issue - #1\]"
  
  
  