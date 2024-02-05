=begin
Problem:
- Given an array of sorted integers, return an array that contains all
missing integers (integers not included in the input array) between
the first and last numbers
- If given an array of 1 integer, return an empty array

Examples:
missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
missing([1, 2, 3, 4]) == []
missing([1, 5]) == [2, 3, 4]
missing([6]) == []

Algorithm:
- Use a submethod to return an array containing every integer between
the first and last integers in the input array
- Initialize an empty result array
- For each integer in the array returned by the submethod, iterate
through the input array. If it doesn't appear in the input array,
add it to the result array
- Return the result array

=end

def missing(input)
  result = []
  (input[0]..input[-1]).to_a.each do |num|
    result << num unless input.include?(num)
  end
  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []