require 'zip'
require 'csv'
require 'pry'

#Zip::InputStream.open("13tokyo.zip") do |io|
#  while (entry = io.get_next_entry)
#    # puts "Contents of #{entry.name}: '#{io.read}'"
#    # 文字列から一行ずつ
#    CSV.parse(io.readline, encoding: "UTF-8:UTF-8") do |row|
#      # use row here...
#      puts row
#    end
#  end
#end

Zip::File.open('13tokyo.zip') do |zip|
  zip.each do |entry|
    CSV.parse(entry.get_input_stream.read).each do |row|
      puts row
    end
  end
end
