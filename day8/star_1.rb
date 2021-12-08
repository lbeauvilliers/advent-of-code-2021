inputs = File.read("inputs.txt").split("\n")
count = 0
unique_lengths = [2, 3, 4, 7]

inputs.each do |input|
  signal_patterns, outputs = input.split(" | ")
  outputs.split(" ").each do |output|
    count += 1 if unique_lengths.include?(output.length)
  end
end

puts count