require 'mechanize'
require 'pry'


asins = []
Mechanize.start do |m|
  m.user_agent_alias = 'Mac Safari'
  retry_on_error times: 20 do
    m.get('https://www.amazon.co.jp/s/?rh=n%3A2250738051%2Cn%3A%212250739051%2Cn%3A2275256051%2Cn%3A2293143051%2Cp_n_date%3A2275273051')
  end
  loop do
    m.page.parser.css('li.s-result-item.celwidget').each do |node|
      # 画像がないものはスキップ
      next if node.css('.s-access-image.cfMarker').blank?
      next if node.css('.s-access-image.cfMarker').attribute('src').value.include? 'no-img'

      asin = node.attributes['data-asin'].value
      pp asin
      asins.push asin
    end
    link = m.page.link_with(id: 'pagnNextLink')
    break if link.nil?
    sleep 5
    retry_on_error times: 20 do
      link.click
    end
  end
end
