require 'zip'
require 'csv'
require 'pry'

dest = './'

Zip::File.open('13tokyo.zip') do |zip|
  zip.each do |entry|
    # binding.pry
    p entry.name
    # { true } は展開先に同名ファイルが存在する場合に上書きする指定
    zip.extract(entry, dest + entry.name) { true }
  end
end
