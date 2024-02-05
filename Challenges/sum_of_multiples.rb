=begin
Given a set of numbers and a maximum, calculate all of the numbers that are multiples of the 
numbers in the set from 1 to the maximum (not including the maximum). Return the sum of those
numbers, no double-counting. If not given a set, default set is 3 and 5.

- We need a class method ::to and an instance method #to. The class method will invoke the
instance method on a Sum instance with the set [3, 5]

Algorithm:
Multiply each input by an increasing counter, adding the product to a result array. Break if 
the product is greater than or equal to the maximum. Return the sum of the result array with 
duplicates removed.
=end

class SumOfMultiples
  attr_reader :set

  def initialize(*args)
    @set = args
  end

  def to(max)
    result = []
    set.each do |num|
      counter = 1
      product = counter * num
      while product < max
        result << product
        counter += 1
        product = counter * num
      end
    end
    result.uniq.sum
  end

  # def to(max)
  #   result = []
  #   1.upto(max - 1) do |num|
  #     result << num if set.any? { |n| num % n == 0 }
  #   end
  #   result.sum
  # end

  def self.to(max)
    SumOfMultiples.new(3, 5).to(max)
  end
end

p SumOfMultiples.new(43, 47).to(10_000)
