require 'pry'
require 'slack-notifier'

notifier = Slack::Notifier.new('https://hooks.slack.com/services/hogehogefugafuga')
notifier.ping('Hello')

# binding.pry

pp 'finish'
