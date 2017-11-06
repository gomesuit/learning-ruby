require 'dotenv/load'
require 'pry'

require 'amazon/ecs'

Amazon::Ecs.configure do |options|
  options[:endpoint] = 'webservices.amazon.co.jp'
  options[:AWS_access_key_id] = ENV['AWS_ACCESS_KEY_ID']
  options[:AWS_secret_key] = ENV['AWS_SECRET_KEY']
  options[:associate_tag] = ENV['ASSOCIATE_TAG']
  options[:country] = 'jp'
  options[:response_group] = 'Large'
end

# To replace default options
# Amazon::Ecs.options = { ... }
Amazon::Ecs::debug = true

asins = ['B00UGU4LF4', 'B010N2825O'] # limit 10 items
res = Amazon::Ecs.item_lookup(asins.join(','))

p res.is_valid_request?
p res.has_error?
p res.error                                 # error message
p res.total_pages
p res.total_results
p res.item_page                             # current page no if :item_page option is provided

# Find elements matching 'Item' in response object
res.items.each do |item|
  # Retrieve string value using XML path
  p item.get('ASIN')
  p item.get('ItemAttributes/Title')

  # Return Amazon::Element instance
  item_attributes = item.get_element('ItemAttributes')
  p item_attributes.get('Title')

  p item_attributes.get_unescaped('Title') # unescape HTML entities
  p item_attributes.get_array('Author')    # ['Author 1', 'Author 2', ...]
  p item_attributes.get('Author')          # 'Author 1'

  # Return a hash object with the element names as the keys
  p item.get_hash('SmallImage') # {:url => ..., :width => ..., :height => ...}
end
