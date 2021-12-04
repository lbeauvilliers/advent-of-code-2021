numbers = File.read("numbers.txt").split(',')
boards = File.read("boards.txt").split(/\n{2,}/)
puzzle_answer = nil
highest_number_index = 0

boards.each do |board|
  rows = board.split("\n").map{ |row| row.split }
  columns = rows.transpose
  board_has_won = false
  i = 0

  while i < numbers.length && !board_has_won
    number = numbers[i]

    rows.each do |row|
      row.delete(number)

      board_has_won = true if row.empty?
      if row.empty? && i > highest_number_index
        highest_number_index = i
        sum = sum_unmarked_numbers(rows)
        puzzle_answer = numbers[i].to_i * sum
        break
      end
    end

    columns.each do |column|
      column.delete(number)

      board_has_won = true if column.empty?
      if column.empty? && i > highest_number_index
        highest_number_index = i
        sum = sum_unmarked_numbers(columns)
        puzzle_answer = numbers[i].to_i * sum
        break
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