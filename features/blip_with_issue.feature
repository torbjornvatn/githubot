Feature: Blip with a #XX issue submitted
  In order to know what issue is worked on
  As a wave user
  I want githubot to replace issue # with issue title
  
  Scenario: Add an issue to wavelet
    Given I connect to localhost
    When I post "blip_with_issue" json
    Then I should see "This is a test issue"
  
  
  