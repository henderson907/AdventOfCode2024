def data_process(data)
  @input = File.read(data)
end

def mull(a,b)
  return a*b
end

def scan_string(input)
  total = 0
  # Finds sections matching mull(x,y)
  real_mem = input.scan(/mul\(\d{1,3},\d{1,3}\)/)
  real_mem.each do |pattern|
    # grabs numbers and sends them to be multipied, adding the result onto the total
    numbs = pattern.scan(/\d{1,3}/)
    total += mull(numbs[0].to_i, numbs[1].to_i)
  end
  return total
end

def solve_part_1(data)
  data_process(data)
  scan_string(@input)
end

def solve_part_2(data)
  data_process(data)
  # splits into sections beginning with "do()"
  sections = @input.split(/do\(\)/)
  # splits up sections where it says "don't" and then subsequently removes following code
  enabled_sections = sections.map { |section| section.split(/don't\(\)/)[0] }.join
  scan_string(enabled_sections)
end

## Answer Part 1: 174960292
puts "Part 1: #{solve_part_1("data.txt")}"

## Answer Part 2: 56275602
puts "Part 2: #{solve_part_2("data.txt")}"
