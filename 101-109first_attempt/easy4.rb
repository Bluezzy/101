

=begin


def string_to_integer(string)

	hash = {'0' => 0,
		      '1' => 1,
	 	      '2' => 2,
	        '3' => 3,
		      '4' => 4,
		      '5' => 5,
		      '6' => 6,
		      '7' => 7,
		      '8' => 8,
		      '9' => 9
	 }

	 numbers = string.split('')
	 array_of_digits = []
	 count = numbers.length

   numbers.each do |unit|
		 count -= 1
	   array_of_digits.push(hash[unit]*(10**(count)))
	 end

	 value = 0

	 array_of_digits.map do |digit|
	   value += digit
	 end

	 value

 end

 p string_to_integer('123')
 p string_to_integer('4536')



def running_total(arr_of_numbers)
	arr_of_totals = []
	result = 0
	arr_of_numbers.each do |number|
	  result += number
		arr_of_totals.push(result)
	end
	arr_of_totals
end

puts running_total([1,5,19,32,45])



def multisum(number)
	arr = []
	for i in 1..number
		arr.push(i) unless (i % 3 !=0 && i % 5 != 0)
	end
	count = 0
	arr.map do |x|
		count += x
	end
	count
end

puts multisum(12)






def leap_year?(year)
	if year >= 1752
		if year % 4 != 0
			false
		else
			unless (year % 100 == 0) && (year % 400 != 0)
				true
			else
				false
			end
		end
	else
		year % 4 == 0
	end
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true


TANT QUE le nombre n'est pas divisible par 4 (année % 4 != 0) :
	false
ELSE(le nombre est divisible par 4):
	UNLESS (année % 100 = 0 && année % 400 != 0
		true
	ELSE
		false



def century(year)
	unless year % 100 == 0
		century = (year/100) + 1
	else
		century = (year/100)
	end
	case
	when century.to_s.end_with?("1") == true
		output = "#{century}st century"
	when century.to_s.end_with?("2") == true
		output = "#{century}nd century"
	when century.to_s.end_with?("3") == true
		output = "#{century}rd century"
	else
		output = "#{century}th century"
	end
	puts output

end



century(2001)
century(1965)
century(256)
century(5)
century(10103)
century(1052)
century(1127)
century(11201)


def short_long_short(str1, str2)
	comparison = str1.length <=> str2.length
	if comparison == 1
		str2 + str1 + str2
	else
		str1 + str2 + str1
	end
end

puts short_long_short('abc','defgh')
puts short_long_short('abcde', 'fgh')
puts short_long_short('', 'xyz')

=end

def size(number)
	counter = 1
	number_of_digits = 0 
	loop do
		counter *= 10
		number_of_digits += 1 # number of digits is the same as the number of times we multiply by 10.
		break if counter > number
	end
	number_of_digits
end

def negative_to_positive(number)
	number * - 1
end

def get_digits(number)
	if number < 0
		number = negative_to_positive(number)
	end
	if size(number) == 1 # Edge case
		return [number]
	end
	counter = size(number) - 1
	divisor = 10 ** counter
	digits = []
	remainer = number
	loop do
		digit = remainer / divisor
		digits << digit
		remainer -= (digit * divisor)
		counter -= 1
		divisor = divisor / 10
		if counter <= 0
			digits << remainer
			break
		end
	end
	digits
end

def number_to_string(number)
	if number < 0
		number = negative_to_positive(number)
	end
	string_digits = { 
	  1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5',
	  6 => '6', 7 => '7', 8 => '8', 9 => 9, 0 => '0'
	}
	digits = get_digits(number)
	result = digits.map do |digit|
		digit = string_digits[digit]
	end
	result.join('')
end

p number_to_string(-12)

def signed_integer_to_string(number)
	if number == 0
		number_to_string(number)
	elsif number > 0
		number_to_string(number).prepend('+')
	else
		number_to_string(number).prepend('-')
	end
end

p signed_integer_to_string(1235)
p signed_integer_to_string(0)
p signed_integer_to_string(-123)
