describe Truck do
  let(:truck) {Truck.new(6)}

  it "initializes with a capacity" do
    expect(truck.capacity).to eq 6
  end

  it "adds and removes boxes" do
    box = Box.new(Occupant.new("Dude", "McDudeson"))

    truck.add_box(box)

    expect(truck.boxes.include?(box)).to eq true

    truck.remove_box(box)

    expect(truck.boxes.include?(box)).to eq false
  end

  it "knows when it's full" do
    6.times do
      truck.add_box(Box.new(Occupant.new("Dude", "McDudeson")))
    end

    expect(truck.full?).to eq true

    expect{truck.add_box(Box.new(Occupant.new("Dude", "McDudeson")))}.to raise_error TruckFullError
  end

  it "can unload all the boxes for a given occupant at once" do
    dude1 = Occupant.new("Dude", "McDudeson")
    dude2 = Occupant.new("Ralph", "Murphy")

    3.times do
      truck.add_box(Box.new(dude1))
      truck.add_box(Box.new(dude2))
    end

    dude1_boxes = truck.unload_all(dude1)
    expect(dude1_boxes.size).to eq 3
  end

end
