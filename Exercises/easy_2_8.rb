def max_by(array)
  return nil if array.empty?
  max_val = yield(array[0])
  max_idx = 0
  array.each_with_index do |item, idx|
    if yield(item) > max_val
      max_val = yield(item)
      max_idx = idx
    end
  end
  array[max_idx]
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil