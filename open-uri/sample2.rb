require 'csv'
require 'pry'
require 'open-uri'
require "zip"
require 'kconv'

@path = 'http://www.post.japanpost.jp/zipcode/dl/oogaki/zip/13tokyo.zip'

open(URI.escape(@path)) do |file|
  Zip::File.open_buffer(file.read) do |zf|
    zf.each do |entry|
      #p entry.name # ファイル名
      #p entry.get_input_stream.read # ファイルの中身
      CSV.parse(entry.get_input_stream.read).each do |row|
        p row.map(&:toutf8)
      end
    end
  end
end

