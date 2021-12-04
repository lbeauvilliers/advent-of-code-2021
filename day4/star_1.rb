numbers = File.read("numbers.txt").split(',')
boards = File.read("boards.txt").split(/\n{2,}/)
lowest_number_index = numbers.length
puzzle_answer = nil

boards.each do |board|
  rows = board.split("\n").map{ |row| row.split }
  columns = rows.transpose
  i = 0

  while i < numbers.length
    number = numbers[i]
    rows.each do |row|
      row.delete(number)
      if row.empty? && i < lowest_number_index
        lowest_number_index = i
        sum = sum_unmarked_numbers(rows)
        puzzle_answer = numbers[i].to_i * sum
      end
    end

    columns.each do |column|
      column.delete(number)
      if column.empty? && i < lowest_number_index
        lowest_number_index = i
        sum = sum_unmarked_numbers(columns)
        puzzle_answer = numbers[i].to_i * sum
      end
    end

    i += 1
  end
end

def sum_unmarked_numbers(arrays)
  sum_unmarked_numbers = 0
  arrays.each do |array|
    sum_unmarked_numbers += array.reduce(0) { |sum, number| sum + number.to_i }
  end

  sum_unmarked_numbers
end

puts puzzle_answer