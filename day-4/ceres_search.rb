# Sort into array of arrays
def data_process(data)
  @input = []
  File.foreach(data) { |line| @input.push(line.rstrip.split("")) }
  @og_column_count = @input[0].length # used later lol
  @og_row_count = @input.length

  ### Below reformats data to pad it out either side
  # inserts 3 empty strings at beginning and end of each line
  @input.each { |row| row.push("","","").insert(0,"","","") }
  ## Adds in 3 empty rows with same length as previous rows at beginning and end
  @input.push(Array.new(@og_column_count + 3) {""}, Array.new(@og_column_count + 3) {""}, Array.new(@og_column_count + 3) {""}).insert(0,Array.new(@og_column_count + 3) {""}, Array.new(@og_column_count + 3) {""}, Array.new(@og_column_count + 3) {""})
end

def check_puzzle_xmas
  ## This nested loop allows us to use coordinates to look at all the letters in the original data
  for i in 2..(@og_column_count + 2) do
    for j in 2..(@og_row_count + 2) do
      if @input[i][j] == "X"
        # All separate if statements as the same "X" may be part of multiple "XMAS"
        @total += 1 if @input[i+1][j] == "M" && @input[i+2][j] == "A" && @input[i+3][j] == "S" # vertical down
        @total += 1 if @input[i-1][j] == "M" && @input[i-2][j] == "A" && @input[i-3][j] == "S" # vertical up
        @total += 1 if @input[i][j+1] == "M" && @input[i][j+2] == "A" && @input[i][j+3] == "S" # horizontal right
        @total += 1 if @input[i][j-1] == "M" && @input[i][j-2] == "A" && @input[i][j-3] == "S" # horizontal left
        @total += 1 if @input[i+1][j+1] == "M" && @input[i+2][j+2] == "A" && @input[i+3][j+3] == "S" # diagonal down right
        @total += 1 if @input[i-1][j-1] == "M" && @input[i-2][j-2] == "A" && @input[i-3][j-3] == "S" # diagonal up left
        @total += 1 if @input[i-1][j+1] == "M" && @input[i-2][j+2] == "A" && @input[i-3][j+3] == "S" # diagonal up right
        @total += 1 if @input[i+1][j-1] == "M" && @input[i+2][j-2] == "A" && @input[i+3][j-3] == "S" # diagonal down left
      end
    end
  end
end

def check_puzzle_part_2
  ## Similar approach as previous part
  ## This nested loop allows us to use coordinates to look at all the letters in the original data
  for i in 2..(@og_column_count + 2) do
    for j in 2..(@og_row_count + 2) do
      if @input[i][j] == "A"
        # All separate if statements as the same "A" may be part of multiple "MAS"*"MAS"
        @total += 1 if @input[i-1][j-1] == "M" && @input[i-1][j+1] == "M" && @input[i+1][j+1] == "S" && @input[i+1][j-1] == "S" # "M" = up left, up right
        @total += 1 if @input[i-1][j-1] == "M" && @input[i+1][j-1] == "M" && @input[i+1][j+1] == "S" && @input[i-1][j+1] == "S" # "M" = up left, down left
        @total += 1 if @input[i+1][j+1] == "M" && @input[i-1][j+1] == "M" && @input[i-1][j-1] == "S" && @input[i+1][j-1] == "S" # "M" = down right, up right
        @total += 1 if @input[i+1][j+1] == "M" && @input[i+1][j-1] == "M" && @input[i-1][j-1] == "S" && @input[i-1][j+1] == "S" # "M" = down right, down left
      end
    end
  end
end

def solve_part_1(data)
  data_process(data)
  @total = 0
  check_puzzle_xmas

  return @total
end

def solve_part_2(data)
  data_process(data)
  @total = 0
  check_puzzle_part_2

  return @total
end

## Answer Part 1: 2500
puts "Part 1: #{solve_part_1("data.txt")}"

## Answer Part 2: 1933
puts "Part 2: #{solve_part_2("data.txt")}"
