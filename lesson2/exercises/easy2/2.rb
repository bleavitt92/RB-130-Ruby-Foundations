def zip(arr1, arr2)
  output = []
  0.upto(arr1.size-1) do |index|
    output << [arr1[index], arr2[index]]
  end
  output
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
