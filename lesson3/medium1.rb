

# Question 1

output = "The Flintstones Rock!"
spaces = 0
while spaces < 10
  puts(" "*spaces + output)
  spaces += 1
end

# Question 2

statement = "The Flintstones Rock!"
occurrences = {} 

statement.split('').each do |char|
  if occurrences.has_key?(char)
    occurrences[char] += 1
  else
    occurrences[char] = 1
  end
end

letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".split('')
occurrences.select! { |key, value| letters.include?(key) }

# Question 3

# puts "the value of 40 + 2 is " + (40 + 2)
# Running this code will raise an error because the expression (40+2) will give an integer that can't be concatenated into a string.
# solution 1:
# puts "the value of 40+2 is" + (40+2).to_s
# solution 2:
# puts "the value of 40+2 is #{40+2}"

# Question 4

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# this code will output :
# 1
# 3
# because we iterate over numbers starting from index 0. At index 0, the number is 1. so p number will output 1. but then we remove the first element of the array.
# at the next step of the iteration, the array will be [2,3,4] and we'll looking at the index1, which is 3. so the code will output3. again we will retrieve the first element of the array,
# which is 2. at the next iteration, the array will be [3,4] and we'll be looking at index2, which is outside of the current size of the array, so the iteration is over.
# so the code will return [3,4] which is the value of numbers.

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# this code can have the behavior we expect because pop method remove the last element and doesn't impact the order when we iterate over indexes.
# at index 0, the value of number is 1. the code output 1 and remove last element of the numbers array. at the next iteration, numbers array is [1,2,3]
# and the index is 1. at index1, number is 2. the code will output 2. then the element "3" is removed from the array. we're let with the array [1,2] but 
# those will never be print out, because the iteration is over. At the next iteration, the index is 2 and is outside of the range of the array.
# to conclude, we can expect this code to output the following :
# 1
# 2
# and return the value of the array we iterated over :
# => [1,2]

# Question 5

def factors(number)
  dividend = number
  divisors = []
  while dividend > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

# Question 6

# The difference between the 2 methods :
# - The first method modifies the first argument within the method and returns it. the #<< method is irreversible.
# - the second method doesn't modify the first argument and is more flexible.

# Question 7

# Concerning Variable scope rules, a method is self-contained. Any variable set respectively outside or inside the method, can't be accessed respectively inside or outside of the method. 
# In the example, the variable is defined outside of the method. it can not be accessed inside the method.
# To fix this, we just need to define the variable inside the method, at the beginning so that the remaining of the code inside the method can access it.

# Question 8

def titleize(string)
  string.split.map(&:capitalize).join(' ')
end

# Question 9

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def age_group(age)
  case age
  when 0..17 then return 'kid'
  when 18..64 then return 'adult'
  else
    return 'senior'
  end
end

munsters.each do |key, value|
  value["age_group"] = age_group(value["age"])
end



