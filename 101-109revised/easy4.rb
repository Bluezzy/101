def short_long_short(string1, string2)
  return "wrong input" if string1.size == string2.size
  if (string1.size <=> string2.size) == 1
    string1 + string2 + string1
  else
    string2 + string1 + string2
  end
end

# Rules :

# 1. Century number : range 1..100 => 1, 101..200 => 2, 2001..2100 => 21.
#                     year.divmod(100)[0] + 1 / year.divmod(100) if remainder == 0 
# 2. Termination : case century number : ..1 => st, 2 => nd, 3 => rd,  except for ..11, ..12, ..13

# Ex : 2000 

def century(year)
  return '1st' if year == 0
  century_number, remainder = year.divmod(100)
  if remainder != 0
    century_number +=1
  end
  century_number = century_number.to_s
  particular_cases = ['11', '12', '13']
  termination = ""
  case
  when particular_cases.include?(century_number[-2..-1]) then termination << 'th'
  when century_number[-1] == '1' then termination << 'st'
  when century_number[-1] == '2' then termination << 'nd'
  when century_number[-1] == '3' then termination << 'rd'
  else
    termination << 'th'
  end
  century_number + termination
end

def multisum(number) # greater than 0
  multiples = (1..number).to_a.select do |n|
    n % 5 == 0 || n % 3 == 0
  end
  multiples.reduce(:+)
  multiples
end

def running_total(numbers) # array of numbers
  running_total = 0
  result = []
  numbers.each do |num|
    running_total += num
    result << running_total
  end
  result
end

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_signed_integer(str)
  if str[0] == '+'
    str = str.chars.reject{|char| char == '+'}.join
    sign_operator = 1
  elsif str[0] == '-'
    str = str.chars.reject{|char| char == '-'}.join
    sign_operator = -1
  else
    sign_operator = 1
  end
  
  digits = str.chars.map { |char| DIGITS[char] }
  result = 0
  power = digits.length - 1
  digits.each do |digit|
    result += digit * (10**power)
    power -= 1
  end
  result * sign_operator
end

# p string_to_signed_integer('24352')
# p string_to_signed_integer('+24352')
# p string_to_signed_integer('-24352')

def integer_to_string(int)
  digits = []
  result, remainder = int.divmod(10)
  digits.unshift(remainder)
  while result != 0
    result, remainder = result.divmod(10)
    digits.unshift(remainder)
  end
  digits.map! do |digit|
    DIGITS.key(digit)
  end
  digits.join
end

def signed_integer_to_string(number)
  return "0" if number == 0
  if number > 0
    "+" + integer_to_string(number)
  else
    "-" + integer_to_string(number * -1)
  end
end

p signed_integer_to_string(4321)
p signed_integer_to_string(0)
p signed_integer_to_string(-123)

  