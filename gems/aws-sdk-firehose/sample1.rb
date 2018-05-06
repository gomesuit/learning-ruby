require 'pry'
require 'aws-sdk-firehose'

client = Aws::Firehose::Client.new

binding.pry

pp 'finish'
