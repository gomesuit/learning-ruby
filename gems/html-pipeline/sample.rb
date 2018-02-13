require 'html/pipeline'

filter = HTML::Pipeline::MarkdownFilter.new("Hi **world**!")
filter.call
