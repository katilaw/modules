
describe Dwelling do
  it "initailzes with an address" do
    # binding.pry
    expect(Dwelling.new("145 Run str", "Boston", "02222")).to be_a(Dwelling)
  end

  it "have access to all attributes" do
    dwelling = Dwelling.new("145 Run str", "Boston", "02222")
    expect(dwelling.address).to eq "145 Run str"
    expect(dwelling.city).to eq "Boston"
    expect(dwelling.zip).to eq "02222"
  end
end
