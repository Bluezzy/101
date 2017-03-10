def rotate_array(arr)
  arr[1..-1].push(arr.first)
end

def rotate_rightmost_digits(number, n)
  digits = number.to_s.chars
  result = digits[0...-n] + rotate_array(digits[-n..-1])
  result.join.to_i
end

# p rotate_rightmost_digits(735291, 1) == 735291
# p rotate_rightmost_digits(735291, 2) == 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917

def max_rotation(number)
  n = number.to_s.size
  result = number
  loop do
    result = rotate_rightmost_digits(result, n)
    n -= 1
    break if n <= 0
  end
  result
end

############ 1000 LIGHTS #########################

bank_of_lights = {}

(1..1000).to_a.each do |light|
  bank_of_lights[light] = "off"
end

def change_state(bank_of_lights, light)
  if bank_of_lights[light] == "off"
    bank_of_lights[light] = "on"
  else
    bank_of_lights[light] = "off"
  end
end

gap = 1
starting_position = 1

1000.times do
  (starting_position..1000).step(gap) do |light|
    change_state(bank_of_lights, light)
  end
  gap += 1
  starting_position += 1
end

lights_on = bank_of_lights.keys.select { |position| bank_of_lights[position] == "on" }

# p lights_on



################### DIAMONDS #######################

# assume the number is positive and odd.

def diamond(n)
  stars = 1
  spaces = (n-stars)/2
  loop do
    puts " "*spaces + "*"*stars + " "*spaces
    stars += 2
    spaces = (n-stars)/2
    break if stars > n
  end
end

def minilang(instructions)
  commands = instructions.split
  stack = []
  register = 0
  commands.each do |command|
    case command
    when 'PUSH' then stack.push(register)
    when 'ADD' then register += stack.pop
    when 'SUB' then register -= stack.pop
    when 'MULT' then register *= stack.pop
    when 'DIV' then register /= stack.pop
    when 'MOD' then register %= stack.pop
    when 'POP' then register = stack.pop
    when 'PRINT' then puts register
    else
      register = command.to_i
    end
  end
end

def word_to_digit(string)
  letters = ("a".."z").to_a + ("A".."Z").to_a
  p letters
  digits = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten']
  words = string.split
  result = words.map do |word|
    if digits.include?(word)
      digits.index(word)
    elsif !letters.include?(word[-1])
      if digits.include?(word[0..-2])
        digits.index(word[0..-2]).to_s + word[-1]
      else
        word
      end
    else
      word
    end
  end
  result.join(' ')      
end

# def fibonacci(n)
#   return 1 if (n == 1 || n == 2)
#   fibonacci(n - 1) + fibonacci(n - 2)
# end

def fibonacci(n)
  return 1 if (n == 1 || n == 2)
  first = 1
  second = 1
  result = 1
  3.upto(n) do
    first = second
    second = result
    result = first + second
  end
  result
end

def fibonacci_last(n)
  fibonacci_number = fibonacci(n)
  fibonacci_number.to_s[-1].to_i
end

