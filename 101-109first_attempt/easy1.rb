=begin

EASY01 - EXO10

def calculate_bonus(integer, boolean)
	boolean ? (integer / 2) : 0
end










EASY1 - EX09

def sum(integer)
	array_of_units = integer.to_s.split('').map do |element|
		element.to_i
	end
	array_of_units.reduce(:+)
end







EASY1 - EX08
def average(array)
	number = 0
	array.each do |integer|
		number += integer
	end
	return (number.to_f/array.size)
end








EASY1 - EX07

def stringy(number)
	string = ""
	while number != 0
		number % 2 == 0 ? string << "0" : string << "1"
		number -= 1
	end
	string.reverse
end




EASY1 - EXO5

def reverse_sentence(sentence)
	array_of_words = sentence.split
	reversed_array = []
	while array_of_words.size != 0
		reversed_array.push(array_of_words.last)
		array_of_words.pop
	end
	reversed_array.join(" ")
end




 EASY1-EXO4

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 
	'motorcycle', 'motorcycle', 'car', 'truck']

def count_occurences(array)
	sorted_array = array.sort
	occurences = {}
	sorted_array.each do |element|
		if occurences.has_key?(element)
			occurences[element] += 1
		else
			occurences[element] = 1
		end
	end
	occurences.each do |key, value|
		puts "#{key} => #{value}"
	end
end

count_occurences(vehicles)

=end



