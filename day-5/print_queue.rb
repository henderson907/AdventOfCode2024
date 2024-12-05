def data_process(data)
  @rules = File.read(data).split("\n\n")[0].split.map{ |rule| rule.split('|').map(&:to_i) }
  @updates = File.read(data).split("\n\n")[1].split
  p @rules
end

def correct?(page, rules)
  rules.none? { |rule| page =~ /#{rule[1]}.*#{rule[0]}/ }
end

def solve_part_1(data)
  data_process(data)

  conforms_to_rule = ->(update, rules) { @rules.none? { |rule| update =~ /#{rule[1]}.*#{rule[0]}/ } }
    middle_page = lambda { |update|
    numbers = update.split(',').map(&:to_i)
    numbers[numbers.length / 2]
  }

  @updates.sum do |update|
    conforms_to_rule.call(update, @rules) ? middle_page.call(update) : 0
  end
end

# def solve_part_2(data)
#   data_process(data)

# end

## Answer Part 1: 4637
puts "Part 1: #{solve_part_1("data.txt")}"

# ## Answer Part 2: 56275602
# puts "Part 2: #{solve_part_2("data.txt")}"


# Get middle number as integer
def middle_num(page)
  nums = page.split(",").map(&:to_i)
  nums[nums.length / 2]
end

# Correct a page using the rules
def correct!(page, rules)
  until correct?(page, rules) do
    rules.each { |rule| page.gsub!(/(#{rule[1]})(.*)(#{rule[0]})/, '\3\2\1') }
  end
end

# Iterate over the pages and sum middle element of corrected pages
def solve_part_2(data)
  data_process(data)

  @updates.sum do |page|
    if !correct?(page, @rules)
      correct!(page, @rules)
      middle_num(page)
    else
      0
    end
  end
end

## Answer Part 2: 6370
puts "Part 2: #{solve_part_2("data.txt")}"
