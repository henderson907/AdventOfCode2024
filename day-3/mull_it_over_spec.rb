require_relative "mull_it_over"

describe "#solve_part_1" do
  it "returns 161 when passed test data" do
    expect(solve_part_1("test_data.txt")).to eq(161)
  end
end

describe "#solve_part_2" do
  it "returns 48 when passed the test data" do
    expect(solve_part_2("test_data.txt")).to eq(48)
  end
end
