binary_numbers = File.read("binary_list.txt").split.map!{ |number| number.chars.map(&:to_i) }
sums = binary_numbers.pop

binary_numbers.each do |number|
  number.each_with_index { |digit, index| sums[index] += digit }
end

gamma = sums.map do |digit|
  digit.to_f/binary_numbers.length > 0.5 && 1 || 0
end.join.to_i(2)

epsilon = sums.map do |digit|
  digit.to_f/binary_numbers.length > 0.5 && 0 || 1
end.join.to_i(2)

puts gamma * epsilon