require 'faker'
require 'pp'

puts Faker::Code.ean
puts Faker::Name.name
puts Faker::Lorem.sentence

Faker::Config.locale = :ja
puts Faker::Name.name
