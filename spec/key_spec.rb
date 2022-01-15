require 'rspec'
require './spec/spec_helper'
require './lib/key'

describe Key do
  before :each do
    @key = Key.new
  end

  it 'exists' do
    expect(@key).to be_a(Key)
  end

  it 'can return a string' do
    expect(@key.key_generator).to be_a(String)
  end


  it 'returns 5 digit number' do
    expect(@key.key_generator.length).to eq(5)
  end

  it 'can read keys' do
    key = Key.new("79671")
    expect(key.a_key).to eq(79)
    expect(key.b_key).to eq(96)
    expect(key.c_key).to eq(67)
    expect(key.d_key).to eq(71)
  end
end
