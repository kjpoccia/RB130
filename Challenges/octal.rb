=begin
Given an octal number, calculate the decimal version

Algorithm:
Check if valid - if any digit is not a number or if any digit is greater than 7, return 0
Iterate through the digits of the number provided, multiply each by 8 to the power of 
an increasing counter. Sum the result
=end

class Octal
  def initialize(num)
    @num = num
  end

  def to_decimal
    sum = 0
    return 0 unless valid?(@num)

    @num.to_i.digits.each_with_index do |n, idx|
      sum += n * (8 ** idx)
    end

    sum
  end

  def valid?(number)
    number.chars.all? { |n| n =~ /[0-7]/ }
  end
end

