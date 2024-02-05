=begin

Problem:
- Given an array and a block, iterate through the array and return true if the block
ever evaluates true (and short circuit).
- Return false otherwise

Algorithm:
- Use each to iterate through the array and yield to the block. If true, return true
=end

def any?(array)
  array.each do |num|
    return true if yield(num)
  end
  false
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false