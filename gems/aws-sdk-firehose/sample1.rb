require 'pry'
require 'aws-sdk-firehose'

client = Aws::Firehose::Client.new

# data = '{"player":{"username":"user1","test":[1,2,3],"characteristics":{"race":"Human","class":"Warlock","subclass":"Dawnblade","power":300,"playercountry":"USA"},"arsenal":{"kinetic":{"name":"Sweet Business","type":"Auto Rifle","power":300,"element":"Kinetic"},"energy":{"name":"MIDA Mini-Tool","type":"Submachine Gun","power":300,"element":"Solar"},"power":{"name":"Play of the Game","type":"Grenade Launcher","power":300,"element":"Arc"}},"armor":{"head":"Eye of Another World","arms":"Philomath Gloves","chest":"Philomath Robes","leg":"Philomath Boots","classitem":"Philomath Bond"},"location":{"map":"Titan","waypoint":"The Rig"}}}'

data = '{"player":{"username":"user1","group":"group1","test":[1,2,3],"characteristics":{"race":"Human","class":"Warlock","subclass":"Dawnblade","power":300,"playercountry":"USA"},"arsenal":{"kinetic":{"name":"Sweet Business","type":"Auto Rifle","power":300,"element":"Kinetic"},"energy":{"name":"MIDA Mini-Tool","type":"Submachine Gun","power":300,"element":"Solar"},"power":{"name":"Play of the Game","type":"Grenade Launcher","power":300,"element":"Arc"}},"armor":{"head":"Eye of Another World","arms":"Philomath Gloves","chest":"Philomath Robes","leg":"Philomath Boots","classitem":"Philomath Bond"},"location":{"map":"Titan","waypoint":"The Rig"}}}'

resp = client.put_record({
  delivery_stream_name: "firehose-test", # required
  record: { # required
    data: data, # required
  },
})

resp = client.put_record_batch({
  delivery_stream_name: "firehose-test", # required
  records: [ # required
    {
      data: data, # required
    },
  ],
})

# binding.pry

pp 'finish'
