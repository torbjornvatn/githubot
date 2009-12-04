# /Users/torbjornvatn/Development/workspace/Githubot-python/src
# --admin_console_server= --port=8080
# /Applications/GoogleAppEngineLauncher.app/Contents/Resources/GoogleAppEngine-default.bundle/Contents/Resources/google_appengine/dev_appserver.py

Given /^I've chosen "([^\"]*)" -> "([^\"]*)"$/ do |user, repo_name|
  @user = user
  @repo_name = repo_name
end

Given /^I type "([^\"]*)"$/ do |issue_nr|
  @issue_nr = issue_nr
end

When /^I trigger a "([^\"]*)" event$/ do |json_file|
  @@request.body = File.read("/Users/torbjornvatn/Development/python/githubot/features/support/#{json_file}.json")  
  @response = call_robot
end

Then /^I should see "([^\"]*)"$/ do |text|
  @response.body.should =~ /#{text}/m
end
