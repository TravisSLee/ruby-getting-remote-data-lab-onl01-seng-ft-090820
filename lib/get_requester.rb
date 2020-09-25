# Write your code here
require 'net/http'
require 'open-uri'
require 'json'

class GetRequester
  
  attr_accessor :url
  
  def initialize(url)
  @url = "http://data.cityofnewyork.us/resource/uvks-tn5n.json"
  end
  def get_response_body
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    response.body
  end
  
  def parse_JSON
    programs = JSON.parse(self.get_response_body)
    programs.collect do |program|
    program["agency"]  
    end
  end
end