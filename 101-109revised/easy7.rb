def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

LOWERCASES = ("a".."z").to_a
UPPERCASES = ("A".."Z").to_a

def letter_case_count(string)
  result = { lowercase: 0, uppercase: 0, neither: 0 }
  characters = string.split('')
  characters.each do |char|
    if LOWERCASES.include?(char)
      result[:lowercase] += 1
    elsif UPPERCASES.include?(char)
      result[:uppercase] += 1
    else
      result[:neither] += 1
    end
  end
  result
end

def word_cap(string)
  string.split.map(&:capitalize).join(' ')
end

def swapcase(string)
  characters = string.chars
  characters.map! do |char|
    if LOWERCASES.include?(char)
      char.upcase
    elsif UPPERCASES.include?(char)
      char.downcase
    else
      char
    end
  end
  characters.join
end

def multiply_lists(arr1, arr2)
  arr1.zip(arr2).map{ |arr| arr.reduce(:*) }
end

def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map { |arr| arr.reduce(:*) }.sort
end

def penultimate(string)
  string.split[-2]
end
    