require 'rspec'
require './spec/spec_helper'
require './lib/offset'

describe Offset do
  before :each do
    @offset_today = Offset.new
    @offset_christmas = Offset.new("251222")
    @date_squared = Time.now.strftime("%d%m%y").to_i**2
  end

  it 'exists' do
    expect(@offset_today).to be_instance_of(Offset)
    expect(@offset_christmas).to be_instance_of(Offset)
  end

  it 'has a date formatted correctly' do
    expect(@offset_today.date.length).to eq(6)
    expect(@offset_today.date).to be_a(String)
    expect(@offset_christmas.date.length).to eq(6)
    expect(@offset_christmas.date).to be_a(String)

  end

  it 'can square the date' do
    expect(@offset_today.date_squared).to eq(@date_squared)
    expect(@offset_christmas.date_squared).to eq(63112493284)

  end

  it 'can give last 4 digits' do
    expect(@offset_today.last_four_digits).to eq(@date_squared.digits[0..3].reverse.join)
    expect(@offset_christmas.last_four_digits).to eq("3284")
  end

  it 'can give each offset value' do
    expect(@offset_today.a_offset).to eq(@date_squared.digits[0].to_s)
    expect(@offset_today.b_offset).to eq(@date_squared.digits[1].to_s)
    expect(@offset_today.c_offset).to eq(@date_squared.digits[2].to_s)
    expect(@offset_today.d_offset).to eq(@date_squared.digits[3].to_s)
    expect(@offset_christmas.a_offset).to eq("3")
    expect(@offset_christmas.b_offset).to eq("2")
    expect(@offset_christmas.c_offset).to eq("8")
    expect(@offset_christmas.d_offset).to eq("4")
  end

end
