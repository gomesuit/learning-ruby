require 'dotenv/load'
require 'pry'
require 'rakuten_web_service'

RakutenWebService.configuration do |c|
  c.application_id = ENV['APPLICATION_ID']
  c.affiliate_id = ENV['AFFILIATE_ID'] # default: nil
  c.max_retries = 3 # default: 5
  c.debug = true # default: false
end

items = RakutenWebService::Kobo::Ebook.search(title: 'エルフさんは痩せられない。 2巻')
pp items.count
pp items.first
