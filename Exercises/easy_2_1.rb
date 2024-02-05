def step(first, last, inc)
  current = first
  while current <= last
    yield(current)
    current += inc
  end
end


p step(1, 10, 3) { |value| puts "value = #{value}" }