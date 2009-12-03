Feature: Githubot added to a wavelet
  In order to interact with the correct repository
  As a wave user
  I want githubot to tell me what repository he is looking at
  
  Scenario: Githubot added to wavelet
    Given I connect to localhost
    When I post "participant_added" json
    Then I should see "I'm looking at: testrepo"