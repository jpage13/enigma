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

  it 'can encrypt a message with a key and no date argument' do
    expect(@enigma.encrypt("hello world", "02715")).to be_a(Hash)
  end

  it 'can decrypt a message with a key and no date argument' do
    encrypted = @enigma.encrypt("hello world", "02715")
    expect(@enigma.decrypt(encrypted[:encryption], "02715")).to be_a(Hash)
  end

  it 'can encrypt a message with no key or date arguments' do
    expect(@enigma.encrypt("hello world")).to be_a(Hash)
  end

end
