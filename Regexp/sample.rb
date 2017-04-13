def check(str)
  if /((\d+)(yen))/ =~ str then
    print("○" + str + "\n")
    print("  [" + $1 + "]\n")
    print("  [" + $2 + "]\n")
    print("  [" + $3 + "]\n")
  else
    print("×" + str + "\n")
  end
end

print("((¥d+)(yen)) にマッチするかどうか\n\n")

check("1980yen")
check("340yen")
