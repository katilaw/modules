describe Apartment do

  let(:apartment) {Apartment.new("∞ money st", "Expensivetown", "99999")}

  it "is a dwelling" do
    expect(apartment).to be_a Dwelling
  end

  it "has a rent" do
    apartment.rent = 5000000000000
    expect(apartment.rent).to eq 5000000000000
  end

  it "has a start and end date" do
    apartment.start_date = "tomorrow"
    apartment.end_date = "yesterday"

    expect(apartment.start_date).to eq "tomorrow"
  end

  it "can add and remove occupants" do
    moneybags = Occupant.new("Mr.", "Moneybags")

    apartment.add(moneybags)
    expect(apartment.contents.size).to eq 1

    apartment.remove(moneybags)
    expect(apartment.contents.size).to eq 0
  end

  it "raises errors when trying to add or remove invalid occupants" do
    moneybags = Occupant.new("Mr.", "Moneybags")

    apartment.add(moneybags)
    expect{apartment.add(moneybags)}.to raise_error(ContainerError)

    apartment.remove(moneybags)
    expect{apartment.remove(moneybags)}.to raise_error(ContainerError)
  end

  it "can fill up" do
    apartment.capacity = 3
    apartment.capacity.times do |i|
      apartment.add(Occupant.new("John", "Smith#{i}"))
    end

    expect(apartment.full?).to eq true
    # binding.pry
    # raise FullApartmentError
    expect{apartment.add(Occupant.new("Mr.", "Moneybags"))}.to raise_error(ContainerError)
  end

end
