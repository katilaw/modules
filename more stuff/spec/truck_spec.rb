describe Truck do
  let(:truck) {Truck.new(6)}

  it "initializes with a capacity" do
    expect(truck.capacity).to eq 6
  end

  it "can unload all the boxes for a given occupant at once" do
    dude1 = Occupant.new("Dude", "McDudeson")
    dude2 = Occupant.new("Ralph", "Murphy")

    3.times do
      truck.add(Box.new(dude1))
      truck.add(Box.new(dude2))
    end

    dude1_boxes = truck.remove_all(dude1)
    expect(dude1_boxes.size).to eq 3
  end

end
