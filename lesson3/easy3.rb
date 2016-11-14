# Question 1

flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Question 2

flintstones.push("Dino")
flintstones << "Dino"

# Question 3

flinstones.concat(["Dino","Bunny"])

# Question 4

advice = "Few things in life are as important as house training your pet dinosaur"
advice.slice!(0, advice.index('house')) # using range as an arg

# Question 5

statement = "The Flintstones Rock!"

# Question 6

statement.scan('t').count
