
def func(i)
  puts "#### Function in Multi Thread : index=#{i}"
end

Parallel.each(1..1000, in_threads: 8) { |i|
  func(i)
}
