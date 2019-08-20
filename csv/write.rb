require 'csv'
require 'pp'

result = CSV.generate do |csv|
    csv << [1, 2, 3]
    csv << ["homu", "mami", "mado"]
end
pp result

CSV.open('test.csv','w') do |test|
 test << ["A","B","C"]
 test << ["milk","coffee","water"]
end
