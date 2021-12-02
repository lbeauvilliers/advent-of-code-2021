x = 0
y = 0

File.foreach("instructions.txt") do |instruction|
  direction, amount = instruction.split(/ /)
  case direction
  when "forward"
    x = x + amount.to_i
  when "down"
    y = y + amount.to_i
  when "up"
    y = y - amount.to_i
  else
    puts "invalid direction"
  end
end

puts x * y