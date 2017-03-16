def crunch(sentence)
	letters = sentence.chars
	cleaned_array = []
	letters.each_index do |index|
		next if letters[index] == letters[index-1]
    cleaned_array.push(letters[index])
	end
	cleaned_array.join
end

puts crunch ("ddddaaiillyyyyyyyy trrrooouuubblllee")


def alphabetic_number_sort(array)
	numbers_hash = {0 => 'zero',
	1 => 'one',
	2 => 'two',
	3 => 'three',
	4 => 'four',
	5 => 'five',
	6 => 'six',
	7 => 'seven',
	8 => 'eight',
	9 => 'nine',
	10 => 'ten',
	11 => 'eleven',
	12 => 'twelve',
	13 => 'thirteen',
	14 => 'fourteen',
	15 => 'fifteen',
	16 => 'sixteen',
	17 => 'seventeen',
	18 => 'eighteen',
	19 => 'nineteen'}
	string_array = []
	array.map do |integer|
		string_array.push(numbers_hash[integer])
	end
	sorted_array = string_array.sort
	last_array = []
	sorted_array.map do |string|
		last_array.push(numbers_hash.key(string))
	end
	last_array
end


def word_sizes(sentence)
	arr = sentence.split
	hash = {}
	arr.each do |word|
		clean_word = word.delete('^A-Za-z')
		key = clean_word.length
		next if key == 0
		if hash.has_key?(key)
			hash[key] += 1
		else
			hash[key] = 1
		end
	end
	return hash
end


def swap(sentence)
	words = sentence.split.map(&:chars)
	words.map do |word|
		first = word[0]
		last = word[-1]
		word.pop
		word.shift
		word.push(first)
		word.unshift(last)
	end
	new_array = words.map do |word|
		word.join
	end
	new_array.join(' ')
end





def after_midnight(string)
	hours = (string.split(':'))[0].to_i
	minutes = string.split(':')[1].to_i
	hours*60 + minutes
end


def before_midnight(string)
	if string == "00:00" || string == "24:00"
		return 0
	else
  	return (1440 - after_midnight(string))
	end
end

def time_of_day(number)
	while number <= 0
		number += 1440
	end
	if number >= 1440
		time = number % 1440
	else
		time = number
	end
	hours = time/60
	minutes = time % 60
	puts format('%02d:%02d', hours, minutes)
end


def ascii_value(string)
	arr = string.split('')
	result = 0
	arr.each do |letter|
		result += letter.ord
	end
	result
end

def print_in_box(string)
	corner_sign, horizontal_sign, vertical_sign = '+', '-', '|'
	line_size = string.size + 4
	lines = []
	first_line = corner_sign + horizontal_sign*(line_size - 2) + corner_sign
	last_line = first_line
	between_line = vertical_sign + " "*(line_size - 2) + vertical_sign
	empty_line = " "*line_size
	message = vertical_sign + " " + string + " " + vertical_sign
	lines << first_line << empty_line << between_line << empty_line <<  message << empty_line << between_line << empty_line << last_line
	lines.each do |line|
		puts line + "\n"
	end
end

print_in_box("")
	

