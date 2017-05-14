require "rantly"
require "pp"

module Languages
  NAMES = %w(c Java Ruby Perl PHP Python Scala Brainfuck)
end

Programmer = Struct.new("Programmer", :name, :age, :languages, :love_programming, :love_numbers)

def generate_programmer
  name = Rantly{choose('tanaka', 'suzuki', 'sato', 'honda', 'noda')}
  age = Rantly{range(10, 80)}
  languages = ::Languages::NAMES.sample(rand(4))
  love_programming = Rantly{boolean}
  love_numbers = Rantly{array(5){range(1, 100)}}
  Programmer.new(name, age, languages, love_programming, love_numbers)
end

10.times {
  programmer = generate_programmer
  pp programmer
}
