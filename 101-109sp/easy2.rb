def prompt(string)
	puts ">> " + string
end


	
EASY2 EXO_08


def factorial(n)
	result = 1
	for i in (1..n)
		result *= i
	end
	return result
end

def range_sum(n)
	result = 0
	for i in (1..n)
		result += i
	end
	return result
end


prompt("Please enter an integer greater than 0:")
number = gets.chomp.to_i

prompt("Enter 's' to compute the sum, 'p' to compute the product.")
operation = gets.chomp

case operation
	when 's' then puts "The sum of the integers between 1 and #{number} is #{range_sum(number)}."
	when 'p' then puts "The product of the integers between 1 and #{number} is #{factorial(number)}."
	else
		puts "Error"
	end


=begin 
EASY2 EXO_06&07


for i in 1..99
	puts i if i%2 != 0
end

for i in 1..99
	puts i
end




EASY2_ EXO_04

CURRENT_YEAR = 2016

prompt("What is your age?")
age = gets.chomp.to_i

prompt("At what age would you like to retire?")
age_of_retirement = gets.chomp.to_i

puts"It's #{CURRENT_YEAR}. You will retire in #{CURRENT_YEAR+(age_of_retirement-age)}"
puts"You have only #{age_of_retirement-age} years of work to go!"




EASY2 - EXO_03


prompt("What is the bill?")
bill = gets.chomp.to_f

prompt("What is the tip percentage?")
tip_percentage = gets.chomp.to_f

tip = bill * (tip_percentage/100)
total = bill + tip

puts "The tip is $#{tip}"
puts "The total is $#{total}"




EASY2 - EXO_02


prompt("Enter the length of the room in meters:")
length = gets.chomp.to_f

prompt("Enter the width of the room in meters:")
width = gets.chomp.to_f

area = width*length

puts "The area of the room is #{area} square meters (#{area*10.7639} square feet)"




EASY2 - EXO_01


def teddy_age()
	age = rand(20..200)
	puts "Teddy is #{age} years old!"
end

teddy_age()

=end