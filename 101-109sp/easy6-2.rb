def reverse!(array)
	left_index = 0
	right_index = -1

	while left_index < array.size / 2
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end

  array
end


def reverse(array)
	arr2 = []
	index = 0
	while index < array.size
		arr2.unshift(array[index])
		index +=1
	end
	arr2
end

def merge(array)
	array = array.flatten
	new_array = []
	array.each_index do |index|
		if new_array.include?(array[index]) == false
			new_array.push(array[index])
		end
	end
	new_array
end

def halvsies(array)
	array1, array2 = [], []
	index = 0
	while index < (array.length/2.0)
		array1.push(array[index])
		index += 1
	end
	while index != array.length
		array2.push(array[index])
		index += 1
	end
	result = [array1, array2]
end

def find_dup(array)
	array.sort.each_index do |index|
		if array[index] == array[index-1]
			return array[index]
		end
	end
end

def include?(array,value)
	array.each do |element|
		if element == value
			return true
		end
	end
	false
end

def triangle(n)
	index = 1
	while index <= n
		puts (' '*(n-index) + '*' * index)
		index += 1
	end
end



