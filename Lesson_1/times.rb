def times(n)
  (0..n - 1).each { |i| yield i }
  n
end

p (times(5) do |num|
  puts num
end)