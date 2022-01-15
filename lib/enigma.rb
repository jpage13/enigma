class Enigma
  ALPHABET = ("a".."z").to_a << " "

  attr_reader :key, :date, :alphabet

  def initialize
    @key
    @date
    @alphabet
  end
end
