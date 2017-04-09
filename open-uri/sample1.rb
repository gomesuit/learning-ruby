require 'csv'
require 'pry'
require 'open-uri'
@path = 'http://www.post.japanpost.jp/zipcode/dl/oogaki/zip/13tokyo.zip'

fileName = File.basename(@path)

open(fileName, 'wb') do |output|
  open(@path) do |data|
    output.write(data.read)
  end
end


