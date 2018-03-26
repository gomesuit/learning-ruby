require "export_param_store/version"
require "aws-sdk-ssm"
require 'erb'

module ExportParamStore
  # Your code goes here...
  def self.start(path)
    @path = path

    client = Aws::SSM::Client.new
    envs = client.get_parameters_by_path(
      {
        path: @path,
        with_decryption: true
      }
    )

    @params = []
    token = nil

    loop do
      parameters = client.get_parameters_by_path(
        {
          path: @path,
          with_decryption: true,
          next_token: token
        }
      )
      @params.concat(parameters[0])
      token = parameters[1]
      break if token.nil?
    end

    contents = <<-ERB
<% @params.each do |param| %>
export <%= param.name.delete(@path) %>=<%= param.value %>
<% end %>
    ERB

    puts ERB.new(contents, nil, 2).result(binding)
  end
end
