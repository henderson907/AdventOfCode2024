require_relative "red_nosed_reports"

describe "#solve_part_1" do
  it "returns 2 when passed test data" do
    expect(solve_part_1("test_data.txt")).to eq(2)
  end
end

describe "#solve_part_2" do
  it "returns 4 when passed the test data" do
    expect(solve_part_2("test_data.txt")).to eq(4)
  end
end
