require 'pry'
require 'aws-sdk'

ec2 = Aws::EC2::Client.new
result = ec2.describe_instances

instances = result[0]

instances.each do |instance|
  binding.pry
  p instance.instances[0].private_ip_address
end


