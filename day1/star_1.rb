depths = File.read("depths.txt").split.map(&:to_i)
count = 0
previous_depth = nil

depths.each do |depth|
  count += 1 if previous_depth && depth > previous_depth
  previous_depth = depth
end

puts count