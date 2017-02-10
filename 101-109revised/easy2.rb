=begin
puts "Enter the width of the room"
width = gets.chomp.to_f
puts "Enter the length of the room"
length = gets.chomp.to_f

square_meters = (width * length).round(2)
square_feet = square_meters * 10.7639.round(2)

p "The area of the room is #{square_meters} square meters (#{square_feet} square feet)."

Exercice sum or product of integers


puts "Please enter an integer greater than 0."
number = gets.chomp.to_i

puts "Please enter your desired operation, 's' for sum and 'p' for product"
operation = gets.chomp

def range_sum(n)
  (1..n).to_a.reduce(:+)
end

def range_product(n)
  (1..n).to_a.reduce(:*)
end

case operation
  when 's' then puts "The sum of integers between 1 and #{number} is #{range_sum(number)}."
  when 'p' then puts "The product of integers between 1 and #{number} is #{range_product(number)}."
end

=end

