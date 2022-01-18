require './lib/offset'

class Shift
  attr_reader :key, :offset

  def initialize(key = key_generator, offset = Offset.new)
    @key = key
    @offset = offset
  end

  def key_generator
    5.times.map { rand(10).to_s }.join
  end

  def a_key
    (@key[0] + @key[1]).to_i
  end

  def b_key
    (@key[1] + @key[2]).to_i
  end

  def c_key
    (@key[2] + @key[3]).to_i
  end

  def d_key
    (@key[3] + @key[4]).to_i
  end

  def date_squared
    @offset.date.to_i * @offset.date.to_i
  end

  def last_four_digits
    date_squared.digits[0..3].reverse.join
  end

  def a_offset
    last_four_digits[0]
  end

  def b_offset
    last_four_digits[1]
  end

  def c_offset
    last_four_digits[2]
  end

  def d_offset
    last_four_digits[3]
  end

  def a_shift
    self.a_key.to_i + a_offset.to_i
  end

  def b_shift
    self.b_key.to_i + b_offset.to_i
  end

  def c_shift
    self.c_key.to_i + c_offset.to_i
  end

  def d_shift
    self.d_key.to_i + d_offset.to_i
  end
end
