require 'pry'
require 'elasticsearch'

client = Elasticsearch::Client.new(host: '192.168.33.10', log: true)

# client.transport.reload_connections!

client.cluster.health

json = '{ "title": "Hello Elasticsearch!" }'
body = JSON.parse(json)

client.create index: 'hello', type: 'world', id: 2, body: body

client.search q: 'Hello'

# binding.pry

pp 'finish'
