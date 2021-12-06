fishes = File.read("fish.txt").split(",").map(&:to_i)
old_counts = initialize_counts
new_counts = initialize_counts

fishes.each do |fish|
  old_counts[fish] += 1
end

i = 0
while i < 80
  new_counts[8] = old_counts[0] # new fishies
  new_counts[7] = old_counts[8]
  new_counts[6] = old_counts[7] + old_counts[0] # old fishies
  new_counts[5] = old_counts[6]
  new_counts[4] = old_counts[5]
  new_counts[3] = old_counts[4]
  new_counts[2] = old_counts[3]
  new_counts[1] = old_counts[2]
  new_counts[0] = old_counts[1]

  old_counts = new_counts
  new_counts = initialize_counts
  i += 1
end

puts old_counts[0] + old_counts[1] + old_counts[2] + old_counts[3] + old_counts[4] + old_counts[5] + old_counts[6] + old_counts[7] + old_counts[8]

def initialize_counts
  counts = {}
  i = 0

  while i < 9
    counts[i] = 0
    i += 1
  end

  counts
end