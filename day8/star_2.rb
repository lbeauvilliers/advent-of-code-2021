inputs = File.read("inputs.txt").split("\n")
sum = 0

inputs.each do |input|
  scrambles_string, outputs_string = input.split(" | ")
  scrambles = scrambles_string.split(" ").map{ |scramble| scramble.chars.sort.join }

  # keeping track of which letter combos correspond to which numbers in our scrambled world
  numbers_to_scrambles = {}

  # identify the obvious numbers
  scrambles.each do |scramble|
    if scramble.length === 2
      numbers_to_scrambles[1] = scramble
    elsif scramble.length === 4
      numbers_to_scrambles[4] = scramble
    elsif scramble.length === 3
      numbers_to_scrambles[7] = scramble
    elsif scramble.length === 7
      numbers_to_scrambles[8] = scramble
    end
  end
  scrambles.delete(numbers_to_scrambles[1])
  scrambles.delete(numbers_to_scrambles[4])
  scrambles.delete(numbers_to_scrambles[7])
  scrambles.delete(numbers_to_scrambles[8])

  # 0, 6, and 9 have 6 letters, but 6 only shares one letter with 1
  numbers_to_scrambles[6] = scrambles.select{ |scramble| scramble.length === 6 && (numbers_to_scrambles[1].chars - scramble.chars).length === 1 }.first
  scrambles.delete(numbers_to_scrambles[6])

  # 3, 2, and 5 have 5 letters, but only 3 has all the same letters as 1
  numbers_to_scrambles[3] = scrambles.select{ |scramble| scramble.length === 5 && (numbers_to_scrambles[1].chars - scramble.chars).length === 0 }.first
  scrambles.delete(numbers_to_scrambles[3])

  # taking away the segments of 3 from 0 leaves 2 segments, but taking away the segments of 3 from 9 leaves 1 segment
  numbers_to_scrambles[0] = scrambles.select{ |scramble| scramble.length === 6 && (scramble.chars - numbers_to_scrambles[3].chars).length === 2 }.first
  numbers_to_scrambles[9] = scrambles.select{ |scramble| scramble.length === 6 && (scramble.chars - numbers_to_scrambles[3].chars).length === 1 }.first
  scrambles.delete(numbers_to_scrambles[0])
  scrambles.delete(numbers_to_scrambles[9])

  # taking away the segments of 5 from 9 leaves 1 segment, and the remaining scramble is 2
  numbers_to_scrambles[5] = scrambles.select{ |scramble| (numbers_to_scrambles[9].chars - scramble.chars).length === 1 }.first
  scrambles.delete(numbers_to_scrambles[5])
  numbers_to_scrambles[2] = scrambles.first

  # for ease of decoding
  scrambles_to_numbers = numbers_to_scrambles.invert

  sum += outputs_string.split(" ").map!{ |output| scrambles_to_numbers[output.chars.sort.join] }.join.to_i
end

puts sum