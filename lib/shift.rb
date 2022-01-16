require './lib/key'
require './lib/offset'

class Shift

  def initialize(key, date)
    @key = Key.new(key)
    @offset = Offset.new(date)
  end

  def a_shift
    @key.a_key.to_i + @offset.a_offset.to_i
  end

  def b_shift
    @key.b_key.to_i + @offset.b_offset.to_i
  end

  def c_shift
    @key.c_key.to_i + @offset.c_offset.to_i
  end

  def d_shift
    @key.d_key.to_i + @offset.d_offset.to_i
  end
end
