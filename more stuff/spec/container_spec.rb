class Test
  include Container

  def initialize
    @capacity = 5
    @allowed = [String, Fixnum]
  end
end

describe Container do

  let(:container){Test.new}

  it "has a list of allowed objects" do
    expect(container.allowed).to eq [String, Fixnum]
  end

  it "can add or remove objects" do
    container.add("cat")
    expect(container.contents.include?("cat")).to eq true

    container.remove("cat")
    expect(container.contents.include?("cat")).to eq false
  end

  it "raises an error when trying to add an object that isn't allowed" do
    expect{container.add([])}.to raise_error(ContainerError)
  end

  it "raises an error when trying to add an object to a full container or remove an object from an empty container" do
    5.times do |i|
      container.add i
    end

    expect{container.add 5}.to raise_error(ContainerError)
  end

  it "raises an error when trying to add an exact duplicate of an item which is already contained" do
    container.add 5
    expect{container.add 5}.to raise_error(ContainerError)
  end

end
