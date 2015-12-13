require 'spec_helper'

describe Occupant do
  it "takes a name and a last name" do
    expect(Occupant.new("John", "Smith")).to be_a Occupant
  end

  it "allows access to the first and last name" do
    johnsmith = Occupant.new("John", "Smith")
    expect(johnsmith.first_name).to eq "John"
    expect(johnsmith.last_name).to eq "Smith"
  end
end
