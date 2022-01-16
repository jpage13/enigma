require 'rspec'
require './spec/spec_helper'
require 'date'
require './lib/key'
require './lib/offset'
require './lib/shift'
require './lib/enigma'

describe Enigma do
  it 'exists' do
    enigma = Enigma.new
    expect(enigma).to be_instance_of(Enigma)
  end
end
