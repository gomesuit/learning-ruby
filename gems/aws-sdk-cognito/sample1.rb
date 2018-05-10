require 'pry'
require 'aws-sdk-cognitoidentity'

client = Aws::CognitoIdentity::Client.new

resp = client.get_identity_pool_roles(
  identity_pool_id: ''
)

puts resp.identity_pool_id #=> String
puts resp.roles #=> Hash
puts resp.roles["RoleType"] #=> String
puts resp.role_mappings #=> Hash
# puts resp.role_mappings["IdentityProviderName"].type #=> String, one of "Token", "Rules"
# puts resp.role_mappings["IdentityProviderName"].ambiguous_role_resolution #=> String, one of "AuthenticatedRole", "Deny"
# puts resp.role_mappings["IdentityProviderName"].rules_configuration.rules #=> Array
# puts resp.role_mappings["IdentityProviderName"].rules_configuration.rules[0].claim #=> String
# puts resp.role_mappings["IdentityProviderName"].rules_configuration.rules[0].match_type #=> String, one of "Equals", "Contains", "StartsWith", "NotEqual"
# puts resp.role_mappings["IdentityProviderName"].rules_configuration.rules[0].value #=> String
# puts resp.role_mappings["IdentityProviderName"].rules_configuration.rules[0].role_arn #=> String

pp 'finish'
