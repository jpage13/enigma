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


  xit 'can return a random 5 digit number' do

end
