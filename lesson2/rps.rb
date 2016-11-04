VALID_CHOICES = %w(rock paper scissors spock lizard)

player_count = 0
computer_count = 0
choice = ''

rps_prompt = <<-MSG
 Welcome to Rock-Paper-Scissors-Spock-Lizard game !(type 'q' to quit)
Are you ready ?
Time to choose : rock     ----> type 'r'
                 paper    ----> type 'p'
                 scissors ----> type 'sc'
                 spock    ----> type 'sp'
                 lizard   ----> type 'l'
MSG

def choice
  puts("Make a choice(r,sc,p,l,sp)(Type'q' to quit)")
  string = gets.chomp
  choice = case string
           when 'r' then 'rock'
           when 'sc' then 'scissors'
           when 'p' then 'paper'
           when 'l' then 'lizard'
           when 'sp' then 'spock'
           when 'q' then 'q'
           else
             return false
           end
  choice
end

def win?(first, second)
    (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
      (first == 'paper' && (second == 'rock' || second == 'spock')) ||
      (first == 'scissors' && (second == 'paper' || second == 'rock')) ||
      (first == 'spock' && (second == 'scissors' || second == 'rock')) ||
      (first == 'lizard' && (second == 'spock' || second == 'paper'))
end

def display_results(player, computer)
  if win?(player, computer)
    "You won!"
  elsif win?(computer, player)
    "Computer won!"
  else
    "It's a tie!"
  end
end

def prompt(message)
  Kernel.puts("=>#{message}")
end

prompt(rps_prompt)

loop do
  choice = choice()
  break if choice == 'q'
  if choice == false
    prompt("Invalid input. Try again.")
    redo
  end

  system'clear'

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}. Computer chose: #{computer_choice}
  \r\n -------
  \r\n -------")

  prompt(display_results(choice, computer_choice))
  puts("-------")

  if win?(choice, computer_choice)
    player_count += 1
  elsif win?(computer_choice, choice)
    computer_count += 1
  end

  prompt("Your score is #{player_count} and the computer score is\
  #{computer_count}")

  break if player_count == 5 || computer_count == 5
end

system 'clear'

if player_count == 5
  prompt("Congratulations ! You defeated the computer. Thank you for playing!")
elsif computer_count == 5
  prompt("Sorry... Seems like you lost against the computer. Thank you\
 for playing!")
else
  prompt("Come back and play another time !")
end
