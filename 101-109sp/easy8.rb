def sum_of_sums(numbers)
	arr = []
	index = numbers.size
	while numbers.empty? == false
		while index != 0
			arr.push(numbers[index-1])
			index -= 1
		end
		numbers.pop
		index = numbers.size
	end
	arr.reduce(:+)
end

