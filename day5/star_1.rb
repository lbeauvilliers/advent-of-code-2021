coordinate_pairs = File.read("coordinates.txt").split("\n")
coord_map = build_coord_map; 0
overlaps = 0

coordinate_pairs.each do |coordinates|
  coordinates = coordinates.split('->').map{ |coord| coord.split(",").map(&:to_i) }

  if coordinates.first[0] === coordinates.last[0]
    row = coord_map[coordinates.first[0]]
    start, stop = coordinates.first[1] < coordinates.last[1] ? [coordinates.first[1], coordinates.last[1]] : [coordinates.last[1], coordinates.first[1]]

    i = start
    while i <= stop
      row[i] += 1
      overlaps += 1 if row[i] === 2
      i += 1
    end
  elsif coordinates.first[1] === coordinates.last[1]
    start, stop = coordinates.first[0] < coordinates.last[0] ? [coordinates.first[0], coordinates.last[0]] : [coordinates.last[0], coordinates.first[0]]

    i = start
    while i <= stop
      row = coord_map[i]
      row[coordinates.first[1]] += 1
      overlaps += 1 if row[coordinates.first[1]] === 2
      i += 1
    end
  else
    puts "ignoring diagonal"
  end
end

puts overlaps

def build_coord_map
  coord_map = {}
  i = 0

  while i < 1000
    row = {}
    j = 0

    while j < 1000
      row[j] = 0
      j += 1
    end

    coord_map[i] = row
    i += 1
  end

  coord_map
end