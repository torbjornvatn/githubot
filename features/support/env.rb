require 'rubygems'
require 'spec'
require 'net/http'

@@request = Net::HTTP::Post.new('/_wave/robot/jsonrpc', initheader = {'Content-Type' =>'application/json'})

def call_robot 
  Net::HTTP.new('localhost', '8080').start {|http| http.request(@@request) }
end