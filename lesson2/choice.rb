VALID_CHOICES = %w(rock paper scissors spock lizard)

def choice
  begin
    puts("Make a choice(r,sc,p,l,sp)(Type'q' to quit)")
    string = gets.chomp
    case string
    when 'r' then choice = 'rock'
    when 'sc' then choice = 'scissors'
    when 'p' then choice ='paper'
    when 'l' then choice = 'lizard'
    when 'sp' then choice = 'spock'
    when 'q' then return
    else
      raise puts "Wrong input"
    end

    return choice unless choice == 'wrong'
  rescue
    retry
  end
end

puts choice
