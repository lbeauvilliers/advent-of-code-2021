x = 0
y = 0
aim = 0

File.foreach("instructions.txt") do |instruction|
  direction, amount = instruction.split(/ /)
  case direction
  when "forward"
    x = x + amount.to_i
    y = y + aim * amount.to_i
  when "down"
    aim = aim + amount.to_i
  when "up"
    aim = aim - amount.to_i
  else
    puts "invalid direction"
  end
end

puts x * y