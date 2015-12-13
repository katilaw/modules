describe Box do
  it "initializes with an occupant name" do
    occupant = Occupant.new("John", "Smith")
    box = Box.new(occupant)

    expect(box.owner).to eq(occupant)
  end
end
