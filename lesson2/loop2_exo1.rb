number_of_lines = nil
input = nil

loop do

	loop do
	  puts '>> How many output lines do you want? Enter a number >= 3: (Q to Quit)'
	  input = gets.chomp
	  number_of_lines = input.to_i
	  break if number_of_lines >= 3 || input.upcase == "Q"
	  puts ">> That's not enough lines."
	end

	while number_of_lines > 0
	  puts 'Launch School is the best!'
	  number_of_lines -= 1
	end

	break if input.upcase == "Q"

end

puts "Out of the program"





=begin 

def prompt(string)
	puts ">> " + string
end

numerator = nil
denominator = nil

def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

loop do
	prompt("Please enter the numerator")
	numerator = gets.chomp
	break if valid_number?(numerator) && numerator.to_i.is_a?(Integer)
	prompt("Invalid input. Only integers are allowed.")
end

loop do
	prompt("Please enter the denominator")
	denominator = gets.chomp
	break if valid_number?(denominator) && denominator.to_i.is_a?(Integer)
	prompt("Invalid input. Only integers are allowed.")
end

puts "<< #{numerator} / #{denominator} is " + (numerator.to_i/denominator.to_i).to_s

=end






