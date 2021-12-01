depths = File.read("depths.txt").split.map(&:to_i)
count = 0
i = 1
previous_window = depths[0] + depths[1] + depths[2]

while i < depths.length - 2 do
  new_window = depths[i] + depths[i+1] + depths[i+2]
  count += 1 if new_window > previous_window
  previous_window = new_window
  i += 1
end

puts count