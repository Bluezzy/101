# Question 1

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# ages.has_key?("Spot") # => false

# Question 2

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

total = 0
ages.each do |key, value|
  total += value
end

total # => 6174

# Question 3

# ages.delete_if( |key, value| value >= 100 )

# Question 4

munsters_description = "The Munsters are creepy in a good way."

"The munsters are creepy in a good way."
"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
"the munsters are creepy in a good way."
"THE MUNSTERS ARE CREEPY IN A GOOD WAY."

munsters_description.capitalize!
munsters_description.swapcase!
munsters_description.downcase!
munsters_description.upcase!

# Question 5

ages.merge!(additional_ages)

# Question 6

ages.min

# Question 7

advice.include?("Dino")

# Question 8

flintstones.find_index { |word| word.start_with?("Ba") }

#Question 9-10

flintstones.map! { |name| name[0,3] }
