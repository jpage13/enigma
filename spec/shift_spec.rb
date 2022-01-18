require 'rspec'
require './spec/spec_helper'
require './lib/offset'
require './lib/shift'

describe Shift do
  before :each do
    @shift_random = Shift.new
    @shift_given = Shift.new("79671", Offset.new("251222"))
  end

  it 'exists' do
    expect(@shift_random).to be_instance_of(Shift)
    expect(@shift_given).to be_instance_of(Shift)
  end

  it 'can give each shift value' do
    expect(@shift_given.a_shift).to eq(82)
    expect(@shift_given.b_shift).to eq(98)
    expect(@shift_given.c_shift).to eq(75)
    expect(@shift_given.d_shift).to eq(75)
  end

  it 'can generate a 1 or 2 or 3 digit shift integer' do
    expect(@shift_random.a_shift.to_s.length).to be <=3
    expect(@shift_random.b_shift.to_s.length).to be <=3
    expect(@shift_random.c_shift.to_s.length).to be <=3
    expect(@shift_random.d_shift.to_s.length).to be <=3
    expect(@shift_random.a_shift.class).to eq(Integer)
    expect(@shift_random.b_shift.class).to eq(Integer)
    expect(@shift_random.c_shift.class).to eq(Integer)
    expect(@shift_random.d_shift.class).to eq(Integer)
  end

  it 'can return a string' do
    expect(@shift_given.key_generator).to be_a(String)
    expect(@shift_random.key_generator).to be_a(String)
  end


  it 'returns 5 digit number' do
    expect(@shift_given.key_generator.length).to eq(5)
    expect(@shift_random.key_generator.length).to eq(5)
  end

  it 'can read keys' do
    expect(@shift_given.a_key).to eq(79)
    expect(@shift_given.b_key).to eq(96)
    expect(@shift_given.c_key).to eq(67)
    expect(@shift_given.d_key).to eq(71)
  end

end
