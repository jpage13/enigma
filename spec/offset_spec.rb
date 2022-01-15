require 'rspec'
require './spec/spec_helper'
require './lib/offset'

describe Offset do
  before :each do
    @offset = Offset.new
  end

  it 'exists' do
    expect(@offset).to be_instance_of(Offset)
  end

  it 'has a date formatted correctly' do
    expect(@offset.date.length).to eq(6)
    expect(@offset.date).to be_a(String)
  end

  it 'can square the date' do
    offset = Offset.new("150122")
    expect(offset.date_squared).to eq(22536614884)
  end

  it 'can give last 4 digits' do
    offset = Offset.new("150122")
    expect(offset.last_four_digits).to eq("4884")
  end

  it 'can give each offset value' do
    offset = Offset.new("150122")
    expect(offset.a_offset).to eq("4")
    expect(offset.b_offset).to eq("8")
    expect(offset.c_offset).to eq("8")
    expect(offset.d_offset).to eq("4")
  end

end
