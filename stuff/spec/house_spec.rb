describe House do
  it "has an asking price" do
    house = House.new("123 456 st", "789ville", "234567890-")
    house.asking_price = 4
    expect(house.asking_price).to eq 4
  end
end
