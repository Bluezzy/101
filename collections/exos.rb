# Exercice 1

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

hash = {}

flintstones.each_index do |index|
  hash[flintstones[index]] = index
end

#Exercice 2

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

total = 0

ages.each do |name, age|
  total += age
end

# Exercice 3

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.reject { |name, age| age > 100 }

# Exercice 4

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.values.min 

# Exercice 5

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each_with_index do |name, index|
  if name.start_with?('Be')
    p index
  end
end

# Exercice 6

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

short_f = flintstones.map do |name|
  name = name[0, 3]
end

# Exercice 7

statement = "The Flintstones Rock"
frequencies = {}
letters = statement.chars.map(&:downcase).select { |letter| letter =~ /\w/ }
letters.each do |letter|
  if frequencies.has_key?(letter)
    frequencies[letter] += 1
  else
    frequencies[letter] = 1
  end
end

# Exercice 9

def titleize(title)
  title.split.map(&:capitalize).join(' ') + "."
end

# Exercice 10

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, features|
  case features ["age"]
  when 0...18 then features["age_group"] = 'kid' 
  when 18...65 then features["age_group"] = 'adult'
  else
    features["age_group"] = 'senior'
  end
end

# Exercice 11

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

male_munsters = 
munsters.select { |member, features| features["gender"] == "male" }

total_ages = 0

male_munsters.each do |member, features|
  total_ages += features["age"]
end

# Exercice 12

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# (name) is a (age) year old (gender)

munsters.each do |member, features|
  puts "#{member} is a #{features['age']} year old #{features['gender']}."
end

# Exercice 13

def generate_random_hex
  rand(15).to_s(16).upcase
end
  
def generate_UIID
  uiid = ''
  8.times do
    uiid << generate_random_hex
  end
  uiid << '-'
  3.times do
    4.times do
      uiid << generate_random_hex
    end
    uiid << '-'
  end
  12.times do
    uiid << generate_random_hex
  end
  uiid
end

p generate_UIID
