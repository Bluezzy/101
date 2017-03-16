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

# Lettercase Counter exercice using different methods, re-usable for other exercices

def lowercase?(letter)
	"a".upto("z").include?(letter)
end

def uppercase?(letter)
	"A".upto("Z").include?(letter)
end


def letter_case_count(string)
	characters = string.split('')
	hash = {lowercase: 0, uppercase: 0, neither: 0}
	characters.each do |character|
		if lowercase?(character) == true
			hash[:lowercase] += 1
		elsif uppercase?(character) == true
			hash[:uppercase] += 1
		else
			hash[:neither] += 1
		end
	end
	hash
end

def word_cap(string)
	string.split.map(&:capitalize).join(' ')
end

def swapcase(string)
	characters = string.split('')
	characters.map! do |char|
		if lowercase?(char) == true
			char.upcase 
		elsif
			uppercase?(char) == true
			char.downcase
		else
			char
		end
	end
	characters.join
end

def staggered_case(string)
	chars = string.split('')
	arr = []
	chars.each_with_index do |char, index|
		if index.even? && (uppercase?(char) || lowercase?(char))
			arr.push(char.capitalize)
		else
			arr.push(char)
		end
	end
	arr.join
end

def show_multiplicative_average(array_of_ints)
	total = 1.0
	array_of_ints.map!(&:to_f).each { |n| total *= n }
	result = (total / array_of_ints.size.to_f).round(3)
	return "The result is #{result}"
end


def multiply_list(arr1,arr2)
	result, index = [], 0
	while index < arr1.size
		result.push(arr1[index]*arr2[index])
		index += 1
	end
	result
end

def multiply_all_pairs(arr1, arr2)
	result = []
	arr1.each_index do |index1|
		arr2.each_index do |index2|
			result.push(arr1[index1]*arr2[index2])
		end
	end
	result.sort
end

def penultimate(string)
	arr = string.split
	arr[-2]
end
















			





