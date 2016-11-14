# QUESTION 1:

a = [1,2,2,4]
a.uniq

# puts a will print :
# 1
# 2
# 2
# 4

# the #flatten method is not destructive, so it doesn't mutate the caller : a.
# a.uniq returns a new array with a different object_id.
# a.uniq! will. the original array change permanently.

# QUESTION 2 :

# In general, ! express either negation or danger :
#  For example, ! could simply mean "not" which express the contrary of any boolean expression.
#  It is often used in a name of a method to alert the coder about its consequences : it usually modify permanently
# the caller of the method.
#
# 1. != means "not equal to" and should be use to compare expressions.
# 2. ! used before an expression is used to turn the expression to its opposite boolean value.
# 3. ! is usually used at the end of a method's name to alert about the destructive behavior of this method.
# 4. ? can be used before within a ternary expression, to check the boolean value of an expression
#   --- expression1 ?(check the boolean value of the expression)  do_this_if_true : do_this_if_false
# 5. ? is usually used at the end of a name of a method that will return a boolean value.
# 6. every object in ruby has a boolean value. using "!!" before an object will return its boolean value.
# In general, unless the object is manipulated, it will return true. Nil makes an exception.

# QUESTION 3 :

advice = "Few things in life are as important as house training your pet dinosaur"
advice.gsub!("important", "urgent")

# QUESTION 4 :

# delete_at(index) method simply delete the value placed at the array's index.
# detete(value) method search for the value passed in in the array and delete it.
# The 2 methods are irreversible in their behavior. the originay array is modified.

# QUESTION 5 :

# (1..100).include?(45)

# QUESTION 6 :

famous_words = "seven years ago..."
# puts "four score and " + famous_words
# puts "four score and" << famous_words

# QUESTION 7 :

# 42

# QUESTION 8 :

# flatten!

# QUESTION 9:

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

flintstones.select! { |key, value| key == "Barney" }
flintstones = flintstones.to_a.flatten
 
# QUESTION 10:

flintstones = ["Fred", "Wilma", "Barney", "Betty", "Batman", "Pebbles"]
hash = {}
flintstones.each_with_index do |value, index|
  hash[value] = index
end

  
    