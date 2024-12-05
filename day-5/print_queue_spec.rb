require_relative "print_queue"

describe "solve_part_1" do
  it "returns 143 when passed test data" do
    expect(solve_part_1("test_data.txt")).to eq(143)
  end
end

describe "solve_part_2" do
  it "returns 123 when passed test data" do
    expect(solve_part_1("test_data.txt")).to eq(123)
  end
end
