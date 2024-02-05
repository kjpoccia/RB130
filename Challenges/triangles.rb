=begin
Given 3 sides, determine if the shape is an equilateral triangle (all sides same length)
an iscosceles triange (two sides of the same length), or scalene (no sides of the same length)
Also make sure that it's a valid trangle (all sides > 0, sum of any two sides must
be greater than the third side)

Algorithm:
Define a class Triangle
Validate within initialize, return ArgumentError if any side is 0 or if any 2 sides sum is 
less than the third side

Define a kind method, sub-methods for each kind
=end

class Triangle
  attr_accessor :s1, :s2, :s3

  def initialize(s1, s2, s3)
    @s1 = s1
    @s2 = s2
    @s3 = s3
    raise ArgumentError.new "Invalid side lengths" if !valid?
  end

  def valid?
    sides = [s1, s2, s3].sort
    (s1 > 0 && s2 > 0 && s3 > 0) &&
    sides[0] + sides[1] > sides[2]
  end

  def equilateral?
    [s1, s2, s3].uniq.size == 1
  end

  def isosceles?
    [s1, s2, s3].uniq.size == 2
  end

  def scalene?
    [s1, s2, s3].uniq.size == 3
  end

  def kind
    if equilateral?
      "equilateral"
    elsif isosceles?
      "isosceles"
    elsif scalene?
      "scalene"
    end
  end


end

# triangle = Triangle.new(0,0,0)
triangle1 = Triangle.new(2, 3, 4)
p triangle1.kind