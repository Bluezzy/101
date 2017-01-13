CHOICES = %w(h hit s stay).freeze
HIT = CHOICES[0..1].freeze
STAY = CHOICES[2..3].freeze
LIMIT = 21

def initialize_deck
  [['H', '2'], ['H', '3'], ['H', '4'], ['H', '5'], ['H', '6'],
   ['H', '7'], ['H', '8'], ['H', '9'], ['H', '10'], ['H', 'J'],
   ['H', 'Q'], ['H', 'K'], ['H', 'A'], ['D', '2'], ['D', '3'],
   ['D', '4'], ['D', '5'], ['D', '6'], ['D', '7'], ['D', '8'],
   ['D', '9'], ['D', '10'], ['D', 'J'], ['D', 'Q'], ['D', 'K'],
   ['D', 'A'], ['C', '2'], ['C', '3'], ['C', '4'], ['C', '5'],
   ['C', '6'], ['C', '7'], ['C', '8'], ['C', '9'], ['C', '10'],
   ['C', 'J'], ['C', 'Q'], ['C', 'K'], ['C', 'A'], ['S', '2'],
   ['S', '3'], ['S', '4'], ['S', '5'], ['S', '6'], ['S', '7'],
   ['S', '8'], ['S', '9'], ['S', '10'], ['S', 'J'], ['S', 'Q'],
   ['S', 'K'], ['S', 'A']]
end

def prompt(message)
  puts "==>> #{message}"
end

def card_value(card)
  value = card[1]
  if value == 'J' || value == 'Q' || value == 'K'
    10
  else
    value.to_i
  end
end

def hand_values(hand)
  hand_values = []
  hand.each do |card|
    hand_values << card[1]
  end
  hand_values
end

def joinand(array, last, delimiter = ',', joining_word = 'and')
  "#{array[0..-2].join(delimiter + ' ')} #{joining_word} #{last}"
end

def show_player_hand(hand)
  puts "You have #{joinand(hand_values(hand), hand_values(hand).last)}"
end

def show_dealer_hand(hand)
  puts "Dealer has #{joinand(hand_values(hand), hand_values(hand).last)}"
end

def show_partial_hand(hand)
  puts "Dealer has #{joinand(hand_values(hand), 'unknown card')}"
end

def hit(deck, hand)
  card = deck.sample
  hand << card
  deck.pop
end

def deal(deck, hand1, hand2)
  2.times do
    card1 = deck.sample
    deck.delete(card1)
    card2 = deck.sample
    deck.delete(card2)
    hand1 << card1
    hand2 << card2
  end
end

def count_aces(hand)
  hand.select { |card| card[1] == 'A' }.count
end

def partial_count(hand)
  total = 0
  hand.each do |card|
    next if card[1] == 'A'
    total += card_value(card)
  end
  total
end

def ace_value(sum)
  if sum < (LIMIT - 10)
    11
  else
    1
  end
end

def total_count(hand)
  number_of_aces = count_aces(hand)
  total = partial_count(hand)
  number_of_aces.times do
    total += ace_value(total)
  end
  total
end

def busted?(hand)
  total_count(hand) > LIMIT
end

def display_card(hand)
  prompt("It's a #{hand.last[1]}")
end

def display_hidden_card(hand)
  prompt("Dealer's hidden card was a #{hand.last[1]} !")
end

def display_totals(your_h, his_h)
  puts "Your total is : #{total_count(your_h)}."
  puts "Dealer's total is : #{total_count(his_h)}."
end

def display_results(your_hand, his_hand)
  if busted?(your_hand)
    show_player_hand(your_hand)
    puts "You busted ! Dealer won."
  elsif busted?(his_hand)
    puts "Dealer busted ! You won"
  elsif won?(your_hand, his_hand)
    display_totals(your_hand, his_hand)
    puts "You won."
  elsif won?(his_hand, your_hand)
    display_totals(your_hand, his_hand)
    puts "Dealer won."
  else
    puts "It's a tie."
  end
end

def won?(hand, opponent_hand)
  (total_count(hand) > total_count(opponent_hand) ||
  busted?(opponent_hand)) && !busted?(hand)
end

def start_game(deck, hand1, hand2)
  deal(deck, hand1, hand2)
  show_partial_hand(hand2)
  show_player_hand(hand1)
end

def hit_or_stay?
  prompt("Would you like to hit or stay? (h/s)")
  answer = gets.chomp.downcase
  while !CHOICES.include?(answer)
    prompt("Wrong input. Please type again. (h/s)")
    answer = gets.chomp.downcase
  end
  answer
end

def display_between_turns(your_hand, his_hand)
  display_hidden_card(his_hand)
  show_dealer_hand(his_hand)
  show_player_hand(your_hand)
end

def player_turn(deck, your_hand, opponent_hand)
  hit(deck, your_hand)
  display_card(your_hand)
  return if busted?(your_hand)
  show_partial_hand(opponent_hand)
  show_player_hand(your_hand)
end

def dealer_turn(deck, hand)
  prompt("Dealer's turn...(press ENTER to continue)")
  gets.chomp
  while total_count(hand) < LIMIT - 4
    prompt('Dealer decides to hit!')
    hit(deck, hand)
    display_card(hand)
    show_dealer_hand(hand)
    return if busted?(hand)
    puts("Press ENTER to continue...")
    gets.chomp
  end
  prompt("Dealer decides to stay")
end

player_score = 0
dealer_score = 0

system('clear')

prompt("Welcome to Twenty One game !")

loop do
  player_hand = []
  dealer_hand = []
  game_deck = initialize_deck.shuffle
  prompt("Press ENTER to deal the cards")
  gets.chomp
  system('clear')
  start_game(game_deck, player_hand, dealer_hand)

  loop do
    choice = hit_or_stay?
    system('clear')
    player_turn(game_deck, player_hand, dealer_hand) if HIT.include?(choice)
    break if STAY.include?(choice) || busted?(player_hand)
  end

  unless busted?(player_hand)
    display_between_turns(player_hand, dealer_hand)
    dealer_turn(game_deck, dealer_hand)
  end

  display_results(player_hand, dealer_hand)

  if won?(player_hand, dealer_hand)
    player_score += 1
  elsif won?(dealer_hand, player_hand)
    dealer_score += 1
  end

  puts "Your score : #{player_score} \nDealer score : #{dealer_score}\n "
  break if player_score == 5 || dealer_score == 5
end

if player_score > dealer_score
  puts "Well done ! You won the overall game. \nThanks for playing."
else
  puts "Oops.. Dealer won the overall game. \nThanks for playing. Bye !"
end
