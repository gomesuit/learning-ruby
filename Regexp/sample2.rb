require 'uri'

def add_query(url, key, value)
  uri = URI.parse(url)
  if uri.query.nil?
    uri.query = key + '=' + value
  else
    uri.query = uri.query + '&' + key + '=' + value
  end
  uri.to_s
end

str = <<EOS
■テキスト　テキスト：
https://www.google.co.jp/

■ああああ　ええええええええ
　ぴよぴよhttps://www.yahoo.co.jp/?qqq=qqqよぴよ

■aaaaaaaaaaaaaaaaaaaa
ほげほげhttps://www.yahoo.co.jp/?lll=ooo&aa=eeほげほげ

うんちゃらかんちゃら
EOS

puts str

# p str.scan(/(?:^|[\s　]+)((?:https?|ftp):\/\/[^\s　]+)/)

REG1 = %r{(https?://[\w/:%#\$&\?\(\)~\.=\+\-]+)}
REG2 = %r{(https?://[-_.!~*\'()a-zA-Z0-9;/?:@&=+$,%#]+)}

# p str.scan(REG1)
# p str.scan(REG2)

# puts str.gsub(REG1, "#{$1}?aaa=bbb")
# puts str.gsub(REG2) { "#{$1}?aaa=bbb" }
puts str.gsub(REG2) { "#{add_query($1, 'aaa', 'bbb')}" }
