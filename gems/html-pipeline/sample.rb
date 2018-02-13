require 'html/pipeline'

filter = HTML::Pipeline::MarkdownFilter.new("Hi **world**!")
pp filter.call



pipeline = HTML::Pipeline.new [
  HTML::Pipeline::MarkdownFilter,
  HTML::Pipeline::SyntaxHighlightFilter
]
result = pipeline.call <<-CODE
This is *great*:

    some_code(:first)

CODE
pp result[:output].to_s
