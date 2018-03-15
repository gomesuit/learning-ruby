require 'pry'
require 'aws-sdk'

client = Aws::SSM::Client.new
pp client.describe_parameters
# binding.pry

pp 'finish'
