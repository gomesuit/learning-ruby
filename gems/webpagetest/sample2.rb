require 'pry'
require 'dotenv/load'
require 'net/http'
require 'uri'
require 'json'

raise if ENV['API_KEY'].nil?

uri = URI("http://www.webpagetest.org/runtest.php?k=#{ENV['API_KEY']}&url=http://webpagetest.org&f=json")
#uri.query = {
#  k: ENV['API_KEY'],
#  url: 'http://webpagetest.org',
#  f: 'json'
#}.to_param

response = Net::HTTP.get_response(uri)

result = JSON.parse(response.body)

binding.pry

# response.code
# response.body

# Check test status
# http://www.webpagetest.org/testStatus.php?f=json&test=170510_5N_17JT

# Getting test results
# http://www.webpagetest.org/jsonResult.php?test=170510_5N_17JT

