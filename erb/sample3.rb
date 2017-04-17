require 'erb'
x=0
contents =<<EOS
ループの開始
<% (1..3).each do |x| %>
   <%= x %> 回目
<% end %>


% (4..6).each do |x|
   <%= x %> 回目
% end 

EOS

erb = ERB.new(contents,nil,'<>')
puts erb.result(binding)
