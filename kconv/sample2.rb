require 'zip'
require 'csv'
require 'pry'
require 'kconv'

Zip::File.open('13tokyo.zip') do |zip|
  zip.each do |entry|
    CSV.parse(entry.get_input_stream.read).each do |row|
      p row.map(&:toutf8)
    end
  end
end
