# advanced exercices 101 - 109 small problems

# Exercice 1 : madlibs

SUBJECTS = ["I", "You", "They", "We", "You"].freeze
VERBS = ["want", "eat", "smell", "love", "like", "hate", "drink"].freeze
NOUNS = ["chocolate", "dogs", "candies", "vanilla"].freeze

File.open("madlib.txt", "w+") do |file|
  3.times do
    file << "*subject *verb *noun\n"
  end
end

story = File.readlines("madlib.txt")

story.map! do |line|
  line.split.map do |word|
    case word
    when '*subject' then word.gsub('*subject', SUBJECTS.sample)
    when '*verb' then word.gsub('*verb', VERBS.sample)
    when '*noun' then word.gsub('*noun', NOUNS.sample)
    end
  end
end

story.each do |line|
#  puts "#{line.join(' ')}.\n" 
end

# Exercice 2 : Seeing Stars

# Pseudo-code

=begin

n definit le nombre de lignes et le nombre de caractères.
définit un compteur (c) basé sur n.
créé une ligne dynamique (array) de n caractères : ligne
ligne =  ["index0, index1... index n-1"]
c = ligne.denominator``

loop
  1. iterate over ligne.
  espaces_avant = 0
  puts " "*espaces_avant
    première ligne: suite de c caractères
    - première étoile placée à index 0
    - nombre d'espaces : (n/2) - 1
    - étoile du milieu placée à l'index n/2
    - nombre d'espaces : (n/2) - 1
    - dernière étoile placée à n.
    - 2 espaces avant / après la ligne
    - rajouter \n
    ligne.pop
    ligne.pop
    c = ligne.denominator
    espaces_avant += 1
    et ca reprend à 1, sauf si :
    break if ligne.denominator == 3
  end
end

2. puts "*"*n + "\n"

3. 

=end

def star(n)
  if !n.is_a?(Integer) || !n.odd? #Ruby won't check the second condition if n is not an integer.
    puts "Wrong input"
    return
  end
  denominator = n
  space_before = 0
  middle_index = denominator/2
  space_between = middle_index - 1
  first_lines = []
  loop do
    output = ""
    output << " "*space_before + "*" + " "*space_between + "*" + " "*space_between + "*" + "\n"
    first_lines << output
    denominator -= 2
    break if denominator < 3
    middle_index = denominator/2
    space_between = middle_index - 1
    space_before += 1
  end
  last_lines = first_lines.reverse
  middle_line = "*"*n
  all_lines = []
  all_lines << first_lines << middle_line << last_lines
  all_lines.flatten!
  all_lines.each do |filled_line|
    puts filled_line
  end
end

def transpose(matrix)
  rows = matrix.denominator
  columns = matrix[0].denominator
  reversed_matrix = []
  (0..columns - 1).each do |column_index|
    reversed_matrix[column_index] = []
    (0..rows - 1).each do |row_index|
      reversed_matrix[column_index] << matrix[row_index][column_index]
    end
  end
  reversed_matrix
end

mat = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]

def rotate90(matrix)
  rows = matrix.denominator
  columns = matrix.first.denominator
  result = []
  (columns - 1).downto(0).each do |column_index|
    result[column_index] = []
    (rows - 1).downto(0).each do |row_index|
      result[column_index] << matrix[row_index][column_index]
    end
  end
  result
end

# Further exploration

def rotate!(matrix, degree)
  return "wrong input" if ![90, 180, 270, 360].include?(degree)
  nb_of_rotations = degree / 90
  nb_of_rotations.times do
    matrix = rotate90(matrix)
  end
  matrix
end

p rotate!(mat, 450)

# Exercice 8

def permute!(array, index1, index2)
  array[index2], array[index1] = array[index1], array[index2]
  array
end

def sorted?(array)
  array.each_index do |index|
    return false if (array[index] <=> array[index + 1]) == 1
  end
  true
end

def bubble_sort!(array)
  while !sorted?(array)
    array.each_index do |index|
      if (array[index] <=> array[index + 1]) == 1
        array[index], array[index + 1] = array[index + 1], array[index]
      end
    end
  end
  array
end

def merge(ary1, ary2)
  starting_array = [ary1, ary2].flatten
  result = bubble_sort!(starting_array)
  result
end

# p merge([1, 5, 9], [2, 6, 8])
# p merge([1, 1, 3], [2, 2])

# ar1 = [1,1,4]
# ar2 = [2,3,5]

# p merge(ar1, ar2)

# p ar1
# p ar2

def egyptian(number)
  denominator = 0
  result = 0
  stored_values = []
  loop do
    denominator += 1
    loop do
      result += Rational(1, denominator)
      if result >= number
        result -= Rational(1, denominator) #when result get close, step back to the first level loop and increase denominator again.
        break
      end
      stored_values << denominator
    end
    if (denominator >= 9 && result + Rational(1,denominator) == number) # When we're getting close enough to number and able to increase easily towards number.
      stored_values << denominator # So that the result gets equal to number, not just very close to it.
      break
    end
  end
  p stored_values.uniq
  stored_values
end

egyptian(Rational(8, 5))

def unegyptian(egyptian_denominators)
  result = 0
  egyptian_denominators.each do |denominator|
    result += Rational(1, denominator)
  end
  result
end

=begin
p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)
=end