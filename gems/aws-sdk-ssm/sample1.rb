require 'pry'
require 'aws-sdk'

client = Aws::SSM::Client.new
pp client.describe_parameters
pp client.get_parameters_by_path(
  {
    path: '/Test/IAD'
  }
)
pp client.get_parameters_by_path(
  {
    path: '/Test/IAD',
    recursive: true
  }
)
pp client.get_parameters_by_path(
  {
    path: '/Test/IAD',
    recursive: true,
    with_decryption: true
  }
)
binding.pry

pp 'finish'
