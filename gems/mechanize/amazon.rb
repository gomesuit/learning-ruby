require 'mechanize'
require 'pry'

Mechanize.start do |m|
  m.get('https://www.amazon.co.jp/s/?rh=n%3A2250738051%2Cn%3A%212250739051%2Cn%3A2275256051%2Cn%3A2293143051%2Cp_n_date%3A2275273051')
  loop do
    m.page.parser.xpath('//li[@class="s-result-item celwidget "]').each do |node|
      p node.attributes['data-asin'].value
    end
    link = m.page.link_with(id: 'pagnNextLink')
    break if link.nil?
    sleep 5
    link.click
  end
end
