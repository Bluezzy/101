def ascii_value(str)
  result = 0
  str.chars.each do |char|
    result += char.ord
  end
  result
end

FORMAT = ['00', '01', '02', '03', '04', '05', '06', '07', '08', '09']

# 3245 minutes

# hours, minutes = 3245.divmod(60)

def time_of_day(number)
  hours, minutes = number.divmod(60)
  hours = hours % 24
  string_hours, string_minutes = '', ''
  if FORMAT[hours] != nil
    string_hours = FORMAT[hours]
  else
    string_hours = hours.to_s
  end
  if FORMAT[minutes] != nil
    string_minutes = FORMAT[minutes]
  else
    string_minutes = minutes.to_s
  end
  "#{string_hours}:#{string_minutes}"
end

def after_midnight(string_time)
  hours = string_time[0..1].to_i
  minutes = string_time[3..4].to_i
  ((hours*60) + minutes) % 1440
end

def before_midnight(string_time)
  (1440 - after_midnight(string_time)) % 1440
end

def swap(sentence)
  words = sentence.split
  words.each do |word|
    word[0], word[-1] = word[-1], word[0]
  end
  words.join(' ')
end

CHARACTERS = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)

def cleanup(string)
  words = []
  non_words = []
  index = 0
  loop do
    word = ""
    non_word = ""
    if CHARACTERS.include?(string[index].downcase)
      loop do
        word << string[index]
        index += 1
        break if string[index] == nil || !CHARACTERS.include?(string[index].downcase)
      end
    else
      loop do
        non_word << string[index]
        index += 1
        break if string[index] == nil || CHARACTERS.include?(string[index].downcase)
      end
    end
    words << word
    non_words << non_word
    break if string[index] == nil
  end
  words.delete("")
  words.join(' ')
end

def word_sizes(string)
  result = {}
  words = string.split
  words.each do |word|
    clean_word = word.delete('^A-Za-z')
    if result.has_key?(clean_word.size)
      result[clean_word.size] += 1
    else
      result[clean_word.size] = 1
    end
  end
  result
end

LETTER_NUMBERS = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven',
'eight', 'nine', 'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen',
'sixteen', 'seventeen', 'eighteen', 'nineteen']

def alphabetic_number_sort(array)
  array.sort_by { |number| LETTER_NUMBERS[number] }
end

def crunch(string)
  characters = string.chars
  result = []
  characters.each_index do |index|
    if characters[index] != characters[index + 1]
      result << characters[index]
    end
  end
  result.join
end

