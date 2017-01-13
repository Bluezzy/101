def rotate_array(arr)
  arr.push(arr.first)
  arr.shift
  arr
end 

def rotate_rightmost_digits(number, n)
  digits = number.to_s.split('')
  result_array = []
  result_array << digits[0...-n] << rotate_array(digits[-n..-1])
  result_array.flatten.join('').to_i
end

def max_rotation(number)
  digits = number.to_s.chars
  count = digits.size
  result = number
  while count > 0
    result = rotate_rightmost_digits(result, count)
    count -= 1
  end
  p result
end





# ======== 1000 Lights ===========


def initialize_bank_of_lights(nb_of_lights)
  bank = {}
  (1..nb_of_lights).each do |index|
    bank[index] = false
  end
  bank
end

def switch(light)
  if light == false
    light = true
  else
    light = false
  end
  light
end

def round(lights)
  1.upto(lights.size) do |round_number|
    lights.each do |index, state|
      lights[index] = switch(lights[index]) if index % round_number == 0
    end
  end
end

bank = initialize_bank_of_lights(1000)
round(bank)
# p bank.select { |index, state| state == true }




# ================== MINILANG ======================

def minilang(commands)
  stack = []
  register = 0
  commands.split(' ').each do |command|
    case command
    when 'ADD'   then register += stack.pop
    when 'DIV'   then register /= stack.pop
    when 'MULT'  then register *= stack.pop
    when 'MOD'   then register %= stack.pop
    when 'SUB'   then register -= stack.pop
    when 'PUSH'  then stack.push(register)
    when 'POP'   then register = stack.pop
    when 'PRINT' then puts register
    else              register = command.to_i
    end
  end
end

def word_to_digit(sentence)
  digits = { 'one' => '1',
             'two' => '2',
             'three' => '3',
             'four' => '4',
             'five' => '5',
             'six' => '6',
             'seven' => '7',
             'eight' => '8',
             'nine' => '9'
  }
  words = sentence.split(' ')
  words.map! do |word|
    if digits.has_key?(word)
      word = digits[word]
    else
      word
    end
  end
  words.join(' ')
end

word_to_digit('Call him at five three one nine')

def longest_sentence(text)
  sentences = text.split(/[.!?][ ]/)
  counter = {}
  sentences.each do |sentence|
    counter[sentence.chars.count] = sentence
  end
  counter.max[-1]
end

def letter_percentages(string)
  lowercases = string.chars.select { |char| char =~ /[a-z]/ }
  uppercases = string.chars.select { |char| char =~ /[A-Z]/ }
  neither = string.chars.select { |char| char =~ /[^a-zA-Z]/ }
  total_chars = string.chars.count.to_f
  lowercases_percentage = (lowercases.count.to_f/total_chars) * 100
  uppercases_percentage = (uppercases.count.to_f/total_chars) * 100
  neither_percentage = (neither.count.to_f/total_chars) * 100
  result = { lowercase: lowercases_percentage.round(2), 
             uppercase: uppercases_percentage.round(2), 
             neither: neither_percentage.round(2)
           }
end

# p letter_percentages('AbCdE+ ')

def balanced?(string)
  parentheses = string.chars.select { |char| char == '(' || char == ')' }
  left_counter = 0
  right_counter = 0
  if parentheses.count('(') == parentheses.count(')')
    parentheses.each do |parenthese|
      left_counter += 1 if parenthese == '('
      right_counter +=1 if parenthese == ')'
      return false if right_counter > left_counter
    end
  else
    return false
  end
  true
end

def valid_triangle?(side1, side2, side3)
  total = side1 + side2 + side3
  lengths = [side1, side2, side3]
  (side1 > 0 && side2 > 0 && side3 >> 0) && (lengths.max <= (total - lengths.max))
end

def triangle(s1, s2, s3)
  if !valid_triangle?(s1, s2, s3)
    return :invalid
  end
  if s1 == s2 && s1 == s3
    :equilateral
  elsif s1 == s2 || s2 == s3 || s3 == s1
    :isosceles
  else
    :scalene
  end
end

def tri_angle(a1, a2, a3) #integers
  case
  when (a1 <= 0 || a2 <= 0 || a3 << 0) && (a1 + a2 + a3 == 180)
  
    
  

