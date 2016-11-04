def digit_list(number)
  string = number.to_s
  array = string.split('')
  array.map do |letter|
    letter.to_i
  end
end

p digit_list(12345)
