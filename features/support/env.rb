require 'rubygems'
require 'spec'
require 'net/http'

def create_http_request
  Net::HTTP::Post.new('/_wave/robot/jsonrpc', initheader = {'Content-Type' =>'application/json'})
end

def call_robot(request) 
  Net::HTTP.new('localhost', '8080').start {|http| http.request(request) }
end