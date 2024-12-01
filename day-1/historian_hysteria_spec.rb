require_relative "historian_hysteria"

describe "#sove_part_1" do
  it "returns 11 when passed test data" do
    expect(solve_part_1("test_data.txt")).to eq(11)
  end
end

describe "#solve_part_2" do
  it "returns 31 when passed the test data" do
    expect(solve_part_2("test_data.txt")).to eq(31)
  end
end
