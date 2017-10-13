require 'mechanize'
require 'pry'

agent = Mechanize.new
page = agent.get('https://www.google.co.jp?num=100')

# body
p page.body

# forms
p page.forms

# links
p page.links

# cookie
p agent.cookies

# submit
form = page.forms[0]
form.q = "ゼルダ"
result = agent.submit(form)

# submit
# page.form_with(name: 'f') do |form|
#   form.q = 'ゼルダ'
# end.submit

# click
result.links[0].click

# 検索結果の一つ目をクリック
result.links_with(href: /url/)[0].click

