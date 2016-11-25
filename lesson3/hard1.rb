# Question 1

if false
  greeting = "hello world"
end

greeting

# any expression evaluates to true unless said otherwise (with nil as an exception).
# the code after the if statement is then not executed. which means that the variable greeting is not defined. 
# However, seems like within a if block, even if the code is not executed, the local variable is initialized to nil. It allows ruby to keep the local variable
# in store if either the expression comes false.

# Question 2

# when we assign informat_greeting to greeting[:a], it points to the same object that has the same value 'hi'.
# informal_greeting.object_id => 20565100
# greetings[:a].object_id => 20565100
# when we use the #<< method, it doesn't create a new object. If modifies the original object. Since informal_greeting and greetings[:a] 
# are the same objects, they are both modified.
# the change operated within informal_greeting is operated as well for the greetings[:a], which is the value of "a" inside the greetings hash.
# Therefore, greetings's key "a" now has the value "hi there"


# Question 3

# A) mess_with_vars(one,two,three) returns the the value of three. let's break it in order :
#    - in the first line of the method, one is being assigned to two. the object referenced by the variable two
#    is being passed to the variable one. the variable one refers now to the object of value "two".
#     in the next line of code, two = three, two is being assigned to the object referenced by the variable three which has 
#     the value "three". in the last line, three is being assigned to the object referenced by the variable one, which still has the value
#     "two". since the last line is returned, mess_with_vars(one, two, three) will return "two".
#   
#     Since a method is self-contained in terms of variable scope rule, it plays around locally with one, two and three
#     as parameters but doesn't modify the original variables that are set outside of the method.

# B) the method assign the variables to new objects and therefore doesn't modify the original objects. 
#     Therefore, one still contains the value"one", two the value "two" and three the value "three".
#    mess_with_vars(one,two,three) returns the value of three (in the last line of code) which is "one".

# C) in this example, the method plays around with the object referenced by the variables one, two and three. the method gsub!
# doesn't create a new object, but rather modify the original object by replacing its value.
# Therefore, after the method is called, one will be equal to "two", two to "three" and three to "one".
# mess_with_vars returns "one" as the last line of code, three.gsub!("three","one") replace "three" by "one" so that the value
# contained by three is "one".

# Question 4

hexadecimals = []
"a".upto("f").each { |character| hexadecimals << character }
1.upto(9).each { |digit| hexadecimals << digit }

def generate_uuid()
  
  hexadecimals = []
  "a".upto("f").each { |character| hexadecimals << character }
  1.upto(9).each { |digit| hexadecimals << digit.to_s }

  uuid = ""
  
  8.times do
    uuid << hexadecimals.sample
  end
  uuid << '-'
  3.times do
    4.times do
      uuid << hexadecimals.sample
    end
    uuid << '-'
  end
  12.times do
    uuid << hexadecimals.sample
  end
  return uuid
end

puts generate_uuid()

# Question 5


    
  







