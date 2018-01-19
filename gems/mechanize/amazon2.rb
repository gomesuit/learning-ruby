require 'mechanize'
require 'pry'

m = Mechanize.new
m.user_agent_alias = 'Mac Safari'

m.get('https://www.amazon.co.jp/dp/B078K85TZQ')

b = m.page.parser.css('.swatchElement a.a-button-text')[1].attributes['href'].value
m.get b

# ISBN-10
pp m.page.parser.css('#detail_bullets_id .content ul li')[3].children[1].text.strip
# ISBN-13
pp m.page.parser.css('#detail_bullets_id .content ul li')[4].children[1].text.strip.gsub('-', '')
