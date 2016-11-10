# question 1:

a = [1,2,2,4]
a.uniq

# puts a will print :
1
2
2
4

# the #flatten method is not destructive, so it doesn't mutate the caller : a.
# a.uniq returns a new array with a different object_id. a.uniq! will
# the original array change permanently.

# question 2 :
