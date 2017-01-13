def sum_of_sums(numbers)
	arr = []
	index = numbers.size
	while numbers.empty? == false
		while index != 0
			arr.push(numbers[index - 1])
			index -= 1
		end
		numbers.pop
		index = numbers.size
	end
	arr.reduce(:+)
end

def madlib
	puts "Enter a noun"
	noun = gets.chomp
	puts "Enter a verb"
	verb = gets.chomp
	puts "Enter an adjective"
	adjective = gets.chomp
	puts "enter an adverb"
	adverb = gets.chomp
	
	puts "There is no #{adjective} #{noun} able to #{verb} #{adverb} in this world !"
end

def substrings_at_start(string)
	arr = []
	index = 0
	while index < string.size
		arr << string[0..index]
		index += 1
	end
	arr
end

def substrings(string)
	index = 0
	arr = []
	while index < string.size
		arr << substrings_at_start(string[index..string.size - 1])
		index += 1
	end
	arr.flatten
end

def palindrome?(string)
  array = string.chars
  return false if array.size == 1
  while array.first == array.last
    array.pop
    array.shift
    break if array.empty?
  end
  array.empty?
end

def palindromish_substrings(string)
	arr = []
	substrings(string).each do |subs|
		arr << subs if palindrome?(subs)
	end
	arr.flatten
end

def fizzbuzz(n1, n2)
	numbers = n1.upto(n2)
	numbers.each do |n|
		if n % 5 == 0 && n % 3 == 0
			puts 'fizzbuzz'
		elsif n % 3 == 0
			puts 'fizz'
		elsif n % 5 == 0
			puts 'buzz'
		else
			puts n
		end 
	end
end

def repeater(string)
	arr = string.chars
	arr2 = []
	arr.each do |char|
		arr2 << char
		arr2 << char
	end
	arr2.join('')
end

CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

def double_consonants(string)
	result = ''
	string.each_char do |char|
		if CONSONANTS.include?(char.downcase)
			result << char << char
		else
			result << char
		end
	end
	result
end

def reversed_number(number)
	number.to_s.reverse.to_i
end

def center_of(string)
	center_index = string.length / 2
	if string.length.even?
		result = string[center_index - 1] + string[center_index]
	else
		result = string[center_index]
	end
	result
end
	
p center_of('Launchschool')
		

