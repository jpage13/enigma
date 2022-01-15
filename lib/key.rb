class Key
  attr_reader :key

  def initialize(key = key_generator)
    @key = key
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

end
