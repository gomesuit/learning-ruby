require 'erb'

contents =<<-EOS
<%= str %>
EOS

str = 'hoge'
erb = ERB.new(contents)
puts erb.result(binding)
