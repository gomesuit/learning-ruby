require 'mechanize'
require 'pry'
require 'retryable'

asins = []
Mechanize.start do |m|
  m.user_agent_alias = 'Mac Safari'
  Retryable.retryable(tries: 10, sleep: 3) do
    m.get('https://www.amazon.co.jp/s/?rh=n%3A2250738051%2Cn%3A%212250739051%2Cn%3A2275256051%2Cn%3A2293143051%2Cp_n_date%3A2275273051')
  end
  m.page.parser.css('li.s-result-item.celwidget').each do |node|
    # 画像がないものはスキップ
    next if node.css('.s-access-image.cfMarker').nil?
    next if node.css('.s-access-image.cfMarker').attribute('src').value.include? 'no-img'

    asin = node.attributes['data-asin'].value
    pp asin
    asins.push asin
  end
end

# pp asins

def parse_isbn(m)
  elem = m.page.parser.css('.swatchElement a.a-button-text')[1]
  return if elem.nil?
  pp elem.attributes['href'].value
  pp elem.css('> span:nth-child(1)').text
  return unless %w[コミックス 単行本].include?(elem.css('> span:nth-child(1)').text)
  elem.attributes['href'].value.split('/')[3]
end

Mechanize.start do |m|
  m.user_agent_alias = 'Mac Safari'

  asins.each do |asin|
    Retryable.retryable(tries: 10, sleep: 5) do
      m.get("https://www.amazon.co.jp/dp/#{asin}")
    end
    # m.page.parser.css('.swatchElement a.a-button-text > span:nth-child(1)')[1].text # コミックス
    # Retryable.retryable(tries: 10, sleep: 5) do
    #   m.get elem.attributes['href'].value
    # end
    # isbn10 = m.page.parser.css('#detail_bullets_id .content ul li')[3].children[1].text.strip
    # isbn13 = m.page.parser.css('#detail_bullets_id .content ul li')[4].children[1].text.strip.gsub('-', '')
    pp "asin: #{asin}, ISBN-10: #{parse_isbn(m)}"
  end
end
