## Splits puzzle data and sorts the two lists
def data_process(data)
  @list_1 = []
  @list_2 = []
  # Reads through data line by line and splits into the two lists
  File.foreach(data) do |line|
    @list_1 << line.split[0].to_i
    @list_2 << line.split[1].to_i
  end
end

def solve_part_1(data)
  # Reads data
  data_process(data)
  # Sorts lists by ascending numbers
  @list_1.sort!
  @list_2.sort!
  total = 0
  @list_1.each_with_index do |el, i|
    total += (el - @list_2[i]).abs
  end
  return total
end

def solve_part_2(data)
  # Reads data
  data_process(data)
  # Creaes a hash of values and number of times they appear in @list_2
  list_2_tally = @list_2.tally
  total = 0
  @list_1.each do |el|
    unless list_2_tally[el] == nil
      total += el * list_2_tally[el]
    end
  end
  return total
end

## Answer Part 1: 2742123
puts "Part 1: #{solve_part_1("data.txt")}"

## Answer Part 2: 21328497
puts "Part 2: #{solve_part_2("data.txt")}"
