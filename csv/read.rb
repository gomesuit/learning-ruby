require 'csv'
require 'pry'

# ファイルから一行ずつ
CSV.foreach("13tokyo.csv") do |row|
  # use row here...
  binding.pry
  puts row
end

