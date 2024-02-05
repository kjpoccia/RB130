# def count(array)
#   result = 0
#   array.each { |num| result += 1 if yield(num) }
#   result
# end

# further exploration

def count(array)
  result = 0
  for i in (0..array.size - 1) do
    result += 1 if yield(array[i])
  end
  result
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2