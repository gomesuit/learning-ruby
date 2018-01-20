require 'dotenv/load'
require 'pry'
require 'rakuten_web_service'

RakutenWebService.configuration do |c|
  c.application_id = ENV['APPLICATION_ID']
  c.affiliate_id = ENV['AFFILIATE_ID'] # default: nil
  c.max_retries = 3 # default: 5
  c.debug = true # default: false
end

# ISBN-10: 4847068114, ISBN-13: 9784847068119
items = RakutenWebService::Books::Book.search(isbn: '4847068114')
items.count
pp items.first
