require 'date'

class Offset
  attr_reader :date

  def initialize(date = Time.now.strftime("%d%m%y"))
    @date = date
  end

  def date_squared
    @date.to_i * @date.to_i
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
end
