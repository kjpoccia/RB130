=begin
Problem:
- Given an integer, return an array containing all of the divisors of the integer

Examples:
divisors(1) == [1]
divisors(7) == [1, 7]
divisors(12) == [1, 2, 3, 4, 6, 12]
divisors(98) == [1, 2, 7, 14, 49, 98]
divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

Algorithm:
- For one up until the integer divided by 2, divide the integer by the number, if the modulo is 0,
add that number to the result array
=end

def divisors(num)
  result = []
  (1..Math.sqrt(num).to_i).each do |i|
    if num % i == 0
      result << i
      result << num / i
    end
  end
  result.uniq.sort
end

p divisors(1) #== [1]
p divisors(7) #== [1, 7]
p divisors(12) #== [1, 2, 3, 4, 6, 12]
p divisors(98) #== [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891]