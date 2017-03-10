def greeting(full_name, features)
  "Hello, #{full_name.join(' ')}! Great to have a "\
  "#{features[:title]} of #{features[:occupation]} around!"
end

# middle = number.size / 2
# even_number = "012345" => "012", "345" => number[0..middle-1], number[middle..-1]
# one_digit_number = "0" => edge case ? => YES
# two_digit_number = "01" => edge case ? => NO => "0", "1" => number[0..0], number[1..-1]

def doubled?(number)
  digits = number.to_s
  middle = digits.size / 2
  return false if digits.size == 1
  if digits.size.even?
    digits[0..(middle-1)] == digits[middle..-1]
  else
    false
  end
end

def twice(number)
  if doubled?(number)
    number
  else
    number * 2
  end
end

# 0
# 1..+infinity
#-infinity.. -1

def negative(number)
  if number > 0
    number * -1
  else
    number
  end
end

def sequence(number)
  (1..number).to_a
end

def uppercase?(string)
  downcases = ("a".."z").to_a
  letters = string.chars
  letters.each do |letter|    
    if downcases.include?(letter)
      return false
    end
  end
  true
end

# words = string.split
# lengths = {}
# words.each do |word|


def word_length(string)
  words = string.split
  lengths = {}
  words.each do |word|
    lengths[word] = word.size.to_s
  end
  result = []
  lengths.each do |word, count|
    result << "#{word} #{count}"
  end
  result
end

def swap_name(full_name)
  first_name = full_name.split[0]
  last_name = full_name.split[1..-1]
  "#{last_name}, #{first_name}"
end

def sequence_count(length, increment)
  total = 0
  sequence = []
  length.times do
    total += increment
    sequence << total
  end
  sequence
end

# 90 <= score <= 100	'A'
# 80 <= score < 90	'B'
# 70 <= score < 80	'C'
# 60 <= score < 70	'D'
# 0 <= score < 60	'F'

def get_grade(score1, score2, score3)
  average = (score1 + score2 + score3) / 3
  case average
  when 90..100 then 'A'
  when 80..89 then 'B'
  when 70..79 then 'C'
  when 60..69 then 'D'
  else
    'E'
  end
end




