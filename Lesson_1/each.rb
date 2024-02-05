def each(arr)
  counter = 0
  while counter < arr.length
    yield arr[counter]
    counter += 1
  end
  arr
end



p (each([1, 2, 3, 4, 5]) do |num|
  puts num
end)