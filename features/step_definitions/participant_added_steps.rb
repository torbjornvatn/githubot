# /Users/torbjornvatn/Development/workspace/Githubot-python/src
# --admin_console_server= --port=8080
# /Applications/GoogleAppEngineLauncher.app/Contents/Resources/GoogleAppEngine-default.bundle/Contents/Resources/google_appengine/dev_appserver.py

require 'rubygems'
require 'spec'
require 'net/http'

Given /^I connect to localhost$/ do
  @host = 'localhost'
  @port = '8080'
  @req = Net::HTTP::Post.new('/_wave/robot/jsonrpc', initheader = {'Content-Type' =>'application/json'})
end

When /^I post "([^\"]*)" json$/ do |json_file|
  @req.body = File.read("/Users/torbjornvatn/Development/workspace/Githubot-python/features/support/#{json_file}.json")  
  @response = Net::HTTP.new(@host, @port).start {|http| http.request(@req) }
end

Then /^I should see "([^\"]*)"$/ do |text|
  @response.body.should =~ /#{text}./m
end
