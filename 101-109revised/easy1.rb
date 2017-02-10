def digits_list(number)
  number.to_s.split("").map(&:to_i)
end

def count_occurrences(array)
  result = {}
  array.each do |word|
    if result.has_key?(word)
      result[word] += 1
    else
      result[word] = 1
    end
  end
  result.each do |word, nb_of_occurences|
    p "The word -#{word}- has #{nb_of_occurences} occurence(s)"
  end
end

# count_occurrences(['a', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'])

def reverse_sentence(string)
  result = ""
  string.chars.each do |char|
    result.prepend(char)
  end
  result
end

# p reverse_sentence("I can type whatever I want")

def reverse_words(string)
  words = string.split(' ')
  result = ""
  words.each do |word|
    result << reverse_sentence(word) + " "
  end
  result
end

# p reverse_words("walk around the block")

def alternate(string)
  if string[-1] == '0'
    string << '1'
  else
    string << '0'
  end
end

def stringy(integer)
  # We assume integer is greater than 0.
  result = '1'
  return result if integer == 1
  (2..integer).each do |n|
    alternate(result)
  end
  result
end

# average = sum of integers / number of integers

def average(numbers_array)
  sum = 0
  numbers_array.each do |int|
    sum += int
  end
  sum / numbers_array.count
end

# p average([12, 24, 36])

def get_digits(number)
  number.to_s.split('').map(&:to_i)
end

def digits_sum(number)
  result = 0
  get_digits(number).each do |digit|
    result += digit
  end
  result
end

def calculate_bonus(salary, boolean)
  if boolean == true
    result = salary + (salary/2)
  else
    result = 0
  end
end

# p calculate_bonus(2800, true)
# p calculate_bonus(3400, false)

