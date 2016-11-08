def interleave(arr1, arr2)
	index = 0
	result = []
	while index <= (arr1.size - 1)
		result.push(arr1[index])
		result.push(arr2[index])
		index += 1
	end
	result
end
