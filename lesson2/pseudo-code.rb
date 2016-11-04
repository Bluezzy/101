1.a method that returns the sum of two integers

=begin 
SET a method with two arguments
	INSIDE the method : if the argument is not an integer, return "error"
						else return the sum of argument1 and argument2
end
=end

def sum(a,b)
	if (a.is_a? Integer) && (b.is_a? Integer)
		result = a + b
	else
		result = "error, please try again"
	end
	puts(result)
end

sum(3,4)
sum(3,"string")


2.a method that takes an array of strings, and returns a string that is all those strings concatenated together

=begin

SET a method that takes an array of strings as argument
	SET a variable containing an empty string
	INSIDE the method, iterate over the array.
	ADD the elements to the variable.

=end

#code to test the logic :

some_array = ["abc","def","ghi","jkl","mno","pqr","stu","vwx","yz"]

def alphabet(array)
	variable = ""
	array.each do |string|
		variable = variable + string
	end
	puts variable
end

alphabet(some_array)

#test the variable scope ?
#puts variable




3.a method that takes an array of integers, and returns a new array with every other element

=begin

SET a method that takes an array as argument..
	SET a variable containing an empty array
	ITERATE over the argument array.
	CHECK if the element is an integer. if not, break. else : 
	FIll the empty array with elements of each type except for integers
	RETURN the new array
	end

	=end






