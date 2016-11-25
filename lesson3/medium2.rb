# Question 1

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_male_ages = 0
munsters.select { |key, value| value["gender"] == "male" } .each do |name, details|
  total_male_ages += details["age"]
end

# Question 2

munsters.each do |name, details|
  puts "#{name} is a #{details["gender"]} of #{details["age"]} years old."
end

# Question 4

sentence = "Humpty Dumpty sat on a wall."

sentence.split.reverse.join(' ').delete('.') + '.'

# Question 5

34.
# The operation within the method doesn't mutate the caller, so the original object is not affected.
# The mehod behave like if the variable 'answer' is passed by value, when the local variable "answer" inside the method point to another object than the original variable "answer"
# the method reassign that variable only inside the method. Is it wiser though to set a different variable's name as an argument as when the operation within the method
# mutate the caller, it will modify the original object. Method will then behave as if the variable "answer" is passed by reference, when there are 2 different variables that points
# to the same object.

# Question 6

# The method take a demo_hash and returns demo_hash. when using "munsters" as a parameter, it will then return munsters together with the potential change 
# operated within the each method that "munsters" is calling. Since index assignments have mutating behaviors, the 'munsters' hash will be modified permanently.

# Question 7

# A bit of maths there going on.
# rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
# we first replace rps("rock", "scissors") with the expected result, "rock" 
# rps(rps(rps("rock, "paper"), "rock" ), "rock")
# the next most "insidish" expression to evaluate is rps("rock, "paper") with the expected result "paper"
# rps(rps("paper", "rock"), "rock" )
# we expect rps("paper", "rock") to return "paper" 
# rps("paper", "rock")
# we know that "paper" still beat "rock" ! as a result, the overall expression is equal to "paper".

# Question 8



def foo(param = "no")
  "yes"
end

def bar(param = "no")           
  param == "no" ? "yes" : "no"
end



bar(foo)

# bar(foo) calls the method foo as a parameter. the foo method is passed without argument, so  the default parameter "no" is used. anyway the method always return "yes".
# which is equivalent to evaluating the expression bar("yes")
# the tinary expression evaluates to false because param != no, simply because the param is now equal to "yes". the overall expression returns "no".
 


