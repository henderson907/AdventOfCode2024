## Splits puzzle data and separates into individual reports
def data_process(data)
  @reports = []
  # Reads through data line by line and splits into the reports, turning each entry into an integer
  File.foreach(data) do |line|
    @reports << line.split.map(&:to_i)
  end
end

def solve_part_1(data)
  data_process(data)
  # Counts number of "safe" reports
  @reports.count { |report| safe?(report) }
end

def solve_part_2(data)
  data_process(data)
  # Counts number of "safe" reports, taking into account the dampner
  @reports.count { |report| tolerant_safe?(report) }
end

def safe?(report)
  # checks if the first two numbers show increase or decrease. Then sets the allowable difference between the subsequent numbers
  if report[1] - report[0] > 0
    diff = [1, 2, 3]
  else
    diff = [-3, -2, -1]
  end

  # Goes through report to check whether the difference is allowable
  (1...report.size).all? { |i| diff.include?(report[i] - report[i - 1]) }
end

def skip_safe?(report, index)
  # makes a copy of the report
  new_report = report.clone
  # deletes problematic number
  new_report.delete_at(index)
  # runs the new report through the safe? method
  safe?(new_report)
end

def tolerant_safe?(report)
  # checks if there are issues
  (0...report.size).any? { |i| skip_safe?(report, i) }
end


## Answer Part 1: 591
puts "Part 1: #{solve_part_1("data.txt")}"

## Answer Part 2: 621
puts "Part 2: #{solve_part_2("data.txt")}"
