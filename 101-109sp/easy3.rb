def palindromic_number?(number)
  string = number.to_s
  string == string.reverse
end

puts palindromic_number?(12321)
puts palindromic_number?(12310)

=begin

EASY3-EXO9

def palindromish(string)
  string.delete('^a-z1-9').downcase == string.delete('^a-z1-9').downcase.reverse
end

puts palindromish("ehhe  , ' ")


EASY3-EXO8

def palindrome?(string)
  array = string.chars
  while array.first == array.last
    array.pop.shift
    break if array.empty?
  end
  array.empty?
end

p palindrome?('madam')
p palindrome?('Madam')
p palindrome?("madam i'm adam")
p palindrome?("356653")


EASY3-EXO7

def oddities(array)
  even_array = []
  array.each_index do |index|
    if index.even?
      even_array.push(array[index])
    end
  end
  even_array
end

p oddities([2,3,4,5,6,7,8])
p oddities(['abc', 'def'])
p oddities([123])
p oddities([])

EASY3-EXO6

def xor?(condition1, condition2)
  if condition1 == true && condition2 ==true
    return false
  elsif condition1 == true && condition2 == false
    return true
  elsif condition1 == false && condition2 == true
    return true
  elsif condition1 == false && condition2 == false
    return false
  else
    return 'wrong input'
  end
end

puts xor?(5.even?, 4.even?)
puts xor?(5.odd?, 4.odd?)
puts xor?(5.odd?, 4.even?)
puts xor?(5.even?, 4.odd?)


EASY3 - EXO5

def multiply(a,b)
  return "no string please" if a.is_a?(Integer) == false || b.is_a?(Integer) == false
  a * b
end

def square(c)
  multiply(c,c)
end

puts square(5)

EASY3 - EXO4

def multiply(a,b)
  return "no string please" if a.is_a?(Integer) == false || b.is_a?(Integer) == false
  a * b
end

puts multiply("a","b")
puts multiply(1,"b")
puts multiply("a",2)
puts multiply(3,4)
puts multiply(5,[1,2,3])





EASY3 - EXO3
puts("Please write word or multiple words")
input = gets.chomp
array.delete(" ")
puts("There are #{array.count} characters in '#{input}'")

EASY3 - EXO1

array = []

prompt("Enter the 1st number:")
number1 = gets.chomp.to_i

prompt("Enter the 2nd number")
number2 = gets.chomp.to_i

prompt("Enter the 3rd number")
number3 = gets.chomp.to_i

prompt("Enter the 4th number")
number4 = gets.chomp.to_i

prompt("Enter the last number")
last_number = gets.chomp.to_i

array.push(number1, number2, number3, number4)

if array.include?(last_number)
  prompt("The number #{last_number} appears in #{array}")
else
  prompt("The number #{last_number} does not appear in #{array}")
end

=end
 # first attempt