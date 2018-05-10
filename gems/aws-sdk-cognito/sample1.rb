require 'pry'
require 'aws-sdk-cognitoidentity'

client = Aws::CognitoIdentity::Client.new


# developer identityでログイン処理を行う
resp = client.get_open_id_token_for_developer_identity(
    identity_pool_id: 'us-east-1:00000000-0000-0000-0000-000000000000',
    logins: { 'com.yujiroarai.provider' => 'abcde' }
  )

puts "Identity ID: #{resp.identity_id}"
puts "Access Token: #{resp.token}"

pp 'finish'
