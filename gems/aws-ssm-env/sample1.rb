require 'pry'
require 'aws-ssm-env'

# AwsSsmEnv.load!(path: '/Test/IAD', recursive: true)
AwsSsmEnv.load!(path: '/Test/IAD')

binding.pry

pp 'finish'
