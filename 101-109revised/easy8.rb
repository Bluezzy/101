def sum_of_sums(numbers)
  total = 0
  count = 0
  loop do
    count += 1
    break if count > numbers.size
    total += numbers.slice(0, count).reduce(:+)
  end
  total
end

def substrings_at_start(string)
  result = []
  characters = string.chars
  1.upto(string.size) do |count|
    result << characters.slice(0, count)
  end
  result.map { |arr| arr.join }
end

def all_substrings(string)
  index = 0
  result = []
  loop do
    result << substrings_at_start(string[index..-1])
    index += 1
    break if index >= string.size
  end
  result.flatten
end

def palindromish?(string)
  string == string.reverse
end

def palindromes(string)
  all_substrings(string).select {|sub_str| palindromish?(sub_str) && sub_str.size > 1 }
end

def fizzbuzz(starting_number, ending_number)
  result = []
  starting_number.upto(ending_number) do |num|
    if num % 3 == 0 && num % 5 == 0
      result << "Fizzbuzz"
    elsif num % 5 == 0
      result << "Buzz"
    elsif num % 3 == 0
      result << "Fizz"
    else
      result << num.to_s
    end
  end
  result.join(', ')
end

def repeater(string)
  index = 0
  result = ""
  loop do
    result << string[index] << string[index]
    index += 1
    break if index >= string.size
  end
  result  
end

def double_consonants(string)
  consonants = %w(b c d f g h j k l m n p q r s t v w x y z)
  index = 0
  result = ""
  loop do
    if consonants.include?(string[index].downcase)
      result << string[index] << string[index]
    else
      result << string[index]
    end
    index += 1
    break if index >= string.size
  end
  result
end

def reversed_number(number)
  number.to_s.reverse.to_i
end

def center_of(string)
  if string.size.even?
    string[(string.size/2 - 1)..(string.size/2)]
  else
    string[string.size/2]
  end
end
