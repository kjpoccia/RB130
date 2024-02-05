=begin
Given a positive natural integer, calculate all of the divisors of the number (not including the
number itself), and then the sum of those numbers. If the sum == the number itself, 
return "perfect", if it's less than the number, return "deficient", if it's greater than
the number, return "abundant". If given anything but a positive integer, raise a StandardError

Algorithm:
Initialize method will return StandardError if input is not an integer
Submethod will calculate array of all of the divisors of a number (iterate through each
integer from 2..n/2, check to see if n modulo integer is 0, add both numbers to the return
array if so)
Main method calls initialize, also submethod, checks sum and returns string based on amount
=end

class PerfectNumber
  def self.calculate_divisors(n)
    result = [1]
    2.upto(n - 1) do |num|
      result << num if n.modulo(num) == 0
    end
    result
  end

  def self.classify(num)
    Praise StandardError unless num.is_a?(Integer) && num > 0
    sum = calculate_divisors(num).sum

    case
    when sum == num
      "perfect"
    when sum < num
      "deficient"
    when sum > num
      "abundant"
    end
  end
end
