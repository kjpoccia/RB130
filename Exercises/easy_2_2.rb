def zip(arr1, arr2)
  result = []
  for i in (0..arr1.size - 1) do
    result << [arr1[i], arr2[i]]
  end
  result
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]