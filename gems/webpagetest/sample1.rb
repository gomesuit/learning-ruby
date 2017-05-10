require 'pry'
require 'dotenv/load'
require 'webpagetest'

raise if ENV['API_KEY'].nil?

wpt = Webpagetest.new(k: ENV['API_KEY'])

locations = wpt.locations
puts locations.keys

response = wpt.run_test do |params|
  params.url = 'http://webpagetest.org'
  params.location = 'ec2-ap-northeast-1'
  params.video = 1
  params.mobile = 1
  params.fvonly = 1
  params.runs = 3
end

loop do
  sleep 10
  break if response.get_status != :running
end

binding.pry

