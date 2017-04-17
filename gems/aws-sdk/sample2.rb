require 'pry'
require 'aws-sdk'

ec2 = Aws::EC2::Resource.new

ec2.instances.each do |instance|
  # binding.pry
  name_tag = instance.tags.select { |tag| tag.key == "Name" } [0]
  if name_tag
    puts name_tag.value
  end
end

