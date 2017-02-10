# Write a method that takes a word problem and returns the answer as an integer.

# What is 12 minus 3 ?
# What is 3 multiplied by -2
# What is 21 divided by 3 ?
# What is 3 plus 11 ?

def get_numbers(string)
  words = string.split
  result = []
  words.each do |word|
    if word.to_i != 0
      result << word.to_i
    end
  end
  result
end

def get_operator(string)
  operators = ["minus", "multiplied", "divided", "plus"]
  result = "" 
  string.split.each do |word|
    if operators.include?(word)
      result << word
    end
  end
  result
end

def calculate(string)
  numbers = get_numbers(string)
  operator = get_operator(string)
  case operator
    when "minus" then numbers[0] - numbers[1] #implicit return : the first matched branch of the case statement
    when "plus" then numbers[0] + numbers[1]
    when "multiplied" then numbers[0] * numbers[1]
    when "divided" then numbers[0] / numbers[1]
  end
end

    
    