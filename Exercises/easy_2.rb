def compute(num)
  block_given? ? yield(num) : "Does not compute."
end

p compute(2) { |num| num + 5 + 3 } == 10
p compute('c') { |letter| 'a' + 'b' + letter } == 'abc'
p compute('fork') == 'Does not compute.'