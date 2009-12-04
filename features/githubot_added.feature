Feature: Githubot added to a wavelet
  In order to interact with the correct repository
  As a wave user
  I want githubot to tell me what repository he is looking at
  
  Scenario: Githubot added to wavelet
    Given I've chosen "githubot" -> "testrepo"
    When I trigger a "participant_added" event
    Then I should see "I'm looking at: testrepo"