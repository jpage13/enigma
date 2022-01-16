require './lib/key'
require './lib/offset'

class Shift
  attr_reader :key, :offset

  def initialize(key = Key.new, date = Offset.new)
    @key = key
    @offset = date
  end

  def a_shift
    self.key.a_key.to_i + self.offset.a_offset.to_i
  end

  def b_shift
    self.key.b_key.to_i + self.offset.b_offset.to_i
  end

  def c_shift
    self.key.c_key.to_i + self.offset.c_offset.to_i
  end

  def d_shift
    self.key.d_key.to_i + self.offset.d_offset.to_i
  end
end
