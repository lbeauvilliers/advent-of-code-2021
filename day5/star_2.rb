coordinate_pairs = File.read("coordinates.txt").split("\n")
coord_map = build_coord_map; 0
overlaps = 0

coordinate_pairs.each do |coordinates|
  coordinates = coordinates.split('->').map{ |coord| coord.split(",").map(&:to_i) }
  first_x_coord = coordinates.first[0]
  first_y_coord = coordinates.first[1]
  second_x_coord = coordinates.last[0]
  second_y_coord = coordinates.last[1]

  if first_x_coord === second_x_coord
    row = coord_map[first_x_coord]
    start, stop = first_y_coord < second_y_coord ? [first_y_coord, second_y_coord] : [second_y_coord, first_y_coord]

    i = start
    while i <= stop
      row[i] += 1
      overlaps += 1 if row[i] === 2
      i += 1
    end
  elsif first_y_coord === second_y_coord
    start, stop = first_x_coord < second_x_coord ? [first_x_coord, second_x_coord] : [second_x_coord, first_x_coord]

    i = start
    while i <= stop
      row = coord_map[i]
      row[first_y_coord] += 1
      overlaps += 1 if row[first_y_coord] === 2
      i += 1
    end
  else
    first_point, last_point = first_x_coord < second_x_coord ? [coordinates.first, coordinates.last] : [coordinates.last, coordinates.first]

    i = first_point[0]
    j = first_point[1]
    positive_slope = first_point[1] < last_point[1]

    while i <= last_point[0]
      row = coord_map[i]
      row[j] += 1
      overlaps += 1 if row[j] === 2
      i += 1
      positive_slope ? j += 1 : j -= 1
    end
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