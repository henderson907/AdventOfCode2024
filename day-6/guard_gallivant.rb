def data_process(data)
  @rows = File.read(data).split
end

def find_locations(n)
  locations = []
  @rows[n].split("").each_with_index do |place, index|
    if place == "#"
      locations << (index + 1)
    end
  end
  return locations
end

def solve_part_1(data)
  data_process(data)

  for i in 0 .. 129 do
    puts "Row #{i+1} - #{find_locations(i)}"
  end
end

### Done manually. Printed coordinates and plotted on a physical map

## Answer Part 1: 4988
puts "Part 1: #{solve_part_1("data.txt")}"


## Answer Part 2: 1697
puts "Part 1: #{solve_part_2("data.txt")}"
