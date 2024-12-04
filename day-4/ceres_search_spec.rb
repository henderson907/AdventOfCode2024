require_relative "ceres_search"

describe "#solve_part_1" do
  it "returns 18 when passed test data" do
    expect(solve_part_1("test_data.txt")).to eq(18)
  end
end

describe "#solve_part_2" do
  it "returns 9 when passed the test data" do
    expect(solve_part_2("test_data.txt")).to eq(9)
  end
end
