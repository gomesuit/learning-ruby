require 'csv'
require 'pry'

# ファイルから一行ずつ
CSV.foreach("13tokyo.csv", encoding: "Shift_JIS:UTF-8") do |row|
  # use row here...
  binding.pry
  puts row
end

