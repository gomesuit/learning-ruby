require 'pry'
require 'dotenv/load'
require 'webpagetest'

raise if ENV['API_KEY'].nil?

wpt = Webpagetest.new(k: ENV['API_KEY'])

response = wpt.run_test do |params|
  params.url = 'http://webpagetest.org'
end

loop do
  sleep 10
  break if response.get_status != :running
end

binding.pry

