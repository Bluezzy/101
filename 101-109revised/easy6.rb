def dms(angle) #floating point angle
  total_seconds = angle * 60 * 60
  total_minutes, seconds = total_seconds.divmod(60)
  degrees, minutes = total_minutes.divmod(60)
  result = [format('%02d', degrees.round(0).to_s), 
  format('%02d', minutes.round(0).to_s, ), format('%02d', seconds.round(0).to_s)]
  puts ("%(#{result[0]}°#{result[1]}'#{result[2]}" + '")')
end

VOWELS = "aeiouAEIOU"

def remove_vowels(strings)
  strings.map { |string| string.delete(VOWELS) }
end

def count_digits(number)
  number.to_s.size
end

def reverse!(array)
  left_index = 0
  right_index = -1
  loop do
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
    break if left_index >= (array.size / 2)
  end
  array
end

def reverse(array)
  result = []
  index = array.size
  loop do
    index -= 1
    break if index < 0
    result << array[index]
  end
  result
end

def merge(arr1, arr2)
  result = []
  arr1. each do |element|
    result << element
  end
  arr2.each do |el|
    result << el
  end
  result.uniq
end

=begin

def halvsies(array)
  return [[], []] if array.size == 0
  return [array, []] if array.size == 1
  arr1 = []
  arr2 = []
  result = [arr1, arr2]
  index = 0
  middle_index = (array.size / 2)
  loop do
    arr1 << array[index]
    index += 1
    if index == middle_index
      if array.size.even?
        arr2 << array[index]
        break
      else
        arr1 << array[index]
        break
      end
    end
    break if index > middle_index
  end
  loop do
    index += 1
    break if index >= array.size
    arr2 << array[index]
  end
  result
end

=end

def halvsies(array)
  return [[], []] if array.size == 0
  return [array, []] if array.size == 1
  middle = array.size / 2
  if array.size.even?
    arr1 = array.slice(0, middle)
    arr2 = array.slice(array.size, middle)
  else
    arr1 = array.slice(0, (middle + 1))
    arr2 = array.slice((middle + 1), middle)
  end
  [arr1, arr2]
end

def find_dup(array)
  checking_array = []
  array.each_index do |index|
    return array[index] if checking_array.include?(array[index])
    checking_array << array[index]
  end
  "no duplications"
end

def is_it_included?(array, element)
  array.each do |el|
    return true if el == element
  end
  false
end

# number_of_stars
# number_of_spaces
def triangle(n)
  if (!n.is_a?(Integer) || !(n > 0))
    puts "wrong input"
    return
  end
  number_of_stars = 1
  number_of_spaces = (n - number_of_stars)
  loop do
    puts (' '*number_of_spaces + '*'*number_of_stars)
    break if number_of_spaces == 0
    number_of_stars += 1
    number_of_spaces -= 1
  end
end

triangle(0)
triangle("wrong input")
triangle(1)
triangle(7)



