require_relative "guard_gallivant"

describe "#solve_part_1" do
  it "returns 41 when passed test data" do
    expect(solve_part_1("test_data.txt")).to eq(41)
  end
end

describe "solve_part_2" do
  it "returns ? when passed test data" do
    expect(solve_part_1("test_data.txt")).to eq(123)
  end
end
