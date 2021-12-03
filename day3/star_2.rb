binary_numbers = File.read("binary_list.txt").split.map!{ |number| number.chars.map(&:to_i) }
i = 0
oxygen_generator_rating = nil

while i < binary_numbers.first.length
  total = binary_numbers.reduce(0) do |sum, binary_number|
    sum + binary_number[i]
  end

  most_common_digit = total.to_f/binary_numbers.length >= 0.5 && 1 || 0
  binary_numbers.select! { |binary_number| binary_number[i] === most_common_digit }
  if binary_numbers.length === 1
    oxygen_generator_rating = binary_numbers.first.join.to_i(2)
    break
  end

  i += 1
end

binary_numbers = File.read("binary_list.txt").split.map!{ |number| number.chars.map(&:to_i) }
i = 0
co2_scrubber_rating = nil

while i < binary_numbers.first.length
  total = binary_numbers.reduce(0) do |sum, binary_number|
    sum + binary_number[i]
  end

  least_common_digit = total.to_f/binary_numbers.length < 0.5 && 1 || 0
  binary_numbers.select! { |binary_number| binary_number[i] === least_common_digit }
  if binary_numbers.length === 1
    co2_scrubber_rating = binary_numbers.first.join.to_i(2)
    break
  end

  i += 1
end

puts oxygen_generator_rating * co2_scrubber_rating