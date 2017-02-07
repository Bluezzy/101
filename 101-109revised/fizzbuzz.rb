# cond1 : number % 3 == 0 then "Fizz"
# cond2 : number % 5 == 0 then "Buzz"
# cond3 = cond1 && cond2
# edgecase : number <= 0


def fizzbuzz(starting, ending)
  if (starting <= 0 || ending <= 0 ) || (ending < starting)
    p "Wrong inputs"
    return
  end
  (starting..ending).each do |int|
    if (int % 3 == 0 && int % 5 == 0)
      p "Fizzbuzz"
    elsif
      int % 3 == 0
      p "Fizz"
    elsif
      int % 5 == 0
      p "Buzz"
    else
      p int
    end
  end
end

fizzbuzz(17, 17)


    