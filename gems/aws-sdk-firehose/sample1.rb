require 'pry'
require 'aws-sdk-firehose'

client = Aws::Firehose::Client.new

resp = client.put_record({
  delivery_stream_name: "firehose-test", # required
  record: { # required
    data: "data", # required
  },
})

binding.pry

pp 'finish'
