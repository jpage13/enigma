require 'date'
require './lib/offset'
require './lib/shift'

class Enigma
  attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def key_generator
    5.times.map { rand(10).to_s }.join
  end

  def encrypt(message, key = key_generator, date = Time.now.strftime("%d%m%y"))
    offset_gen = Offset.new(date)
    shifts = Shift.new(key, offset_gen)
    encryption = {}
    encrypted_message = []
    message_chunk = message.chars.each_slice(4).to_a
    message_chunk.each do |group|
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
    encryption[:date] = offset_gen.date
    encryption
  end

  def decrypt(ciphertext, key = nil, date = Time.now.strftime("%d%m%y"))
    shifts = Shift.new(key, Offset.new(date))
    decryption = {}
    decrypted_message = []
    ciphertext_chunks = ciphertext.chars.each_slice(4).to_a
    ciphertext_chunks.each do |group|
      group_hash = Hash[group.map.with_index {|letter, index| [index, letter]}]
      group_hash.each do |index, letter|
        if index == 0
          decrypted_message << @alphabet.rotate(shifts.a_shift*-1)[@alphabet.index(group[0].downcase)]
        elsif index == 1
          decrypted_message << @alphabet.rotate(shifts.b_shift*-1)[@alphabet.index(group[1].downcase)]
       elsif index == 2
         decrypted_message << @alphabet.rotate(shifts.c_shift*-1)[@alphabet.index(group[2].downcase)]
       elsif index == 3
         decrypted_message << @alphabet.rotate(shifts.d_shift*-1)[@alphabet.index(group[3].downcase)]
       end
     end
   end
   decryption[:decryption] = decrypted_message.join
   decryption[:key] = key
   decryption[:date] = date
   decryption
  end
end
