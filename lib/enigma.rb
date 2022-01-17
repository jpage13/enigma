require 'date'
require './lib/key'
require './lib/offset'
require './lib/shift'

class Enigma
  attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def encrypt(message, key, date)
    shifts = Shift.new(key, date)
    encryption = {}
    encrypted_message = []
    parse_message = message.chars.each_slice(4).to_a
    parse_message.each do |group|
      group_hash = Hash[group.map.with_index {|letter, index| [index, letter]}]
      group_hash.each do |index, letter|
        if index == 0
          encrypted_message << @alphabet.rotate(shifts.a_shift)[@alphabet.index(group[0].downcase)]
        elsif index == 1
          encrypted_message << @alphabet.rotate(shifts.b_shift)[@alphabet.index(group[1].downcase)]
        elsif index == 2
          encrypted_message << @alphabet.rotate(shifts.c_shift)[@alphabet.index(group[2].downcase)]
        elsif index == 3
          encrypted_message << @alphabet.rotate(shifts.d_shift)[@alphabet.index(group[3].downcase)]
        end
      end
    end

    encryption[:encryption] = encrypted_message.join
    encryption[:key] = key
    encryption[:date] = date
    encryption
  end

  def decrypt(ciphertext, key, date)
  end

end
