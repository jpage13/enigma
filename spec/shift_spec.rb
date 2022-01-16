require 'rspec'
require './spec/spec_helper'
require './lib/key'
require './lib/offset'
require './lib/shift'

describe Shift do
  it 'exists' do
    key = Key.new("79671")
    offset = Offset.new("150122")
    shift = Shift.new(key, date)
    expect(shift).to be_instance_of(Shift)
  end

  it 'can give each shift value' do
    key = Key.new("79671")
    offset = Offset.new("150122")
    shift = Shift.new(key, date)
    expect(shift.a_shift).to eq(83)
    expect(shift.b_shift).to eq(104)
    expect(shift.c_shift).to eq(75)
    expect(shift.d_shift).to eq(75)
  end
end
