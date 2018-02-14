require 'redcarpet'
require './original_html.rb'

markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
pp markdown.render("This is *bongos*, indeed.")

renderer = Redcarpet::Markdown.new(OriginalHTML.new, autolink: true, tables: true)
pp renderer.render('This is *bongos*, indeed.')
