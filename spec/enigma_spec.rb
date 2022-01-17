require 'rspec'
require './spec/spec_helper'
require './lib/enigma'

describe Enigma do
  before :each do
    @enigma = Enigma.new
  end

  it 'exists' do
    expect(@enigma).to be_instance_of(Enigma)
  end

  it 'can encrypt message with given key and date' do
    expected = {encryption: "keder ohulw", key: "02715", date: "040895"}
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
  end

  it 'can decrypt ciphertext with given key and date' do
    expected =  {decryption: "hello world", key: "02715", date: "040895"}
    expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected)
  end

  xit 'can encrypt a message with a key and no date argument' do
  end

  xit 'can decrypt a message with a key and no date argument' do
  end

  xit 'can encypt a message with no key or date arguments' do
  end

end
