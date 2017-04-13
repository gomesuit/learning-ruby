require 'uri'

uri = URI.parse("http://www.ruby-lang.org/")

p uri.scheme    # => "http"
p uri.host      # => "www.ruby-lang.org"
p uri.port      # => 80
p uri.path      # => "/"
