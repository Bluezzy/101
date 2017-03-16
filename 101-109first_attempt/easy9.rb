def greetings(name, skill)
  "Hello #{name.join(' ')} ! We are glad to have a #{skill[:title]} \n 
  #{skill[:occupation]} here !"
end


def doubled?(number)
  number = number.to_s
  number_of_digits = number.size
  center_index = (number_of_digits / 2)
  left_part = number[0..center_index-1]
  right_part = number[center_index..-1]
  left_part == right_part
end

def twice(number)
  return number*2 if number.to_s.size == 1
  if doubled?(number)
    number
  else
    number*2
  end 
end

def negative(int)
  return 0 if int == 0
  if int.positive?
    int * -1
  else
    int
  end
end

def sequence(number)
  result = []
  while number > 0
    result << number
    number -= 1
  end 
  result.sort
end

def uppercase?(string)
  string == string.upcase
end

def words_length(words_string)
  words = words_string.split(' ')
  words.each_index do |index|
    words[index] += " #{words[index].chars.count}"
  end
end

def swap_name(full_name)
  first_name = full_name.split(' ')[0]
  last_name = full_name.split(' ')[-1]
  "#{last_name}, #{first_name}"
end

def sequence(count, first_number)
  result = []
  multiplier = 1
  count.times do
    result << multiplier * first_number
    multiplier += 1
  end 
  result
end

def get_grade(score1, score2, score3)
  average_score = (score1 + score2 + score3) / 3
  case
  when average_score >= 90 then 'A'
  when average_score >= 80 && average_score <= 90 then 'B'
  when average_score >= 70 && average_score <= 80 then 'C'
  when average_score >= 60 && average_score <= 70 then 'D'
  when average_score >= 50 && average_score <= 60 then 'E'
  else
    'F'
  end 
end

def buy_fruit(list)
  result = []
  list.each do |fruit|
    fruit[-1].times do
      result << fruit[0]
    end
  end
  result
end


