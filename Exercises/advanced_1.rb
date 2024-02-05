

fact = Enumerator.new do |y|
  a = 1
  num = 0
  loop do
    y << a
    num += 1
    a = num == 1 ? 1 : a * num
  end
end

p fact.next
p fact.next
p fact.next
p fact.next
