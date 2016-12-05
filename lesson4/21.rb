PERMANENT_VALUES = { '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
                     '7' => 7, '8' => 8, '9' => 9, '10' => 10,
                     'J' => 10, 'Q' => 10, 'K' => 10 }.freeze

CHOICES = %w(h hit s stay).freeze

def initialize_desk
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

def hand_values(hand)
  hand_values = []
  hand.each do |card|
    hand_values << card[1]
  end
  hand_values
end

def show_player_hand(hand)
  puts "You have #{hand_values(hand)[0..-2].join(', ')} and " \
  "#{hand_values(hand).last}"
end

def show_dealer_hand(hand)
  puts "Dealer has #{hand_values(hand)[0..-2].join(', ')} and " \
  "#{hand_values(hand).last}"
end

def show_partial_hand(hand)
  hand_values = []
  hand.each do |card|
    hand_values << card[1]
  end
  puts "Dealer has #{hand_values[0..-2].join(', ')} and unknown card"
end

def hit(desk, hand)
  card = desk.sample
  hand << card
  desk.delete(card)
  card
end

def deal(desk, hand1, hand2)
  card1 = desk.sample
  desk.delete(card1)
  card2 = desk.sample
  desk.delete(card2)
  card3 = desk.sample
  desk.delete(card3)
  card4 = desk.sample
  desk.delete(card4)
  hand1 << card1 << card3
  hand2 << card2 << card4
end

def count_aces(hand)
  hand.select { |card| card[1] == 'A' }.count
end

def partial_count(hand)
  total = 0
  hand.each do |card|
    next if card[1] == 'A'
    total += PERMANENT_VALUES[card[1]]
  end
  total
end

def ace_value(sum)
  if sum <= 10
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
  total_count(hand) > 21
end

def see_card(hand)
  prompt("It's a #{hand.last[1]}")
end

def see_hidden_card(hand)
  prompt("Dealer's hidden card was a #{hand.last[1]} !")
end

def hit_ace(desk, hand) # for pry tests
  ace = desk.select { |any_card| any_card[1] == 'A' }.sample
  hand << ace
  desk.delete(ace)
end

def dealer_turn(desk, hand)
  prompt("Dealer's turn...(press ENTER to continue)")
  gets.chomp
  while total_count(hand) < 17
    prompt('Dealer decides to hit!')
    hit(desk, hand)
    see_card(hand)
    show_dealer_hand(hand)
    if busted?(hand)
      return
    end
    puts("Press ENTER to continue...")
    gets.chomp
  end
  prompt("Dealer decides to stay")
end

def display_totals(your_h, his_h)
  puts "Your total is : #{total_count(your_h)}."
  puts "Dealer's total is : #{total_count(his_h)}."
end

def display_results(your_hand, his_hand)
  if busted?(your_hand)
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

def start_game(desk, hand1, hand2)
  deal(desk, hand1, hand2)
  show_partial_hand(hand2)
  show_player_hand(hand1)
end

player_score = 0
dealer_score = 0

system('clear')

prompt("Welcome to Twenty One game !")

loop do
  player_hand = []
  dealer_hand = []
  game_desk = initialize_desk
  prompt("Press ENTER to deal the cards")
  gets.chomp

  system('clear')
  start_game(game_desk, player_hand, dealer_hand)

  loop do
    prompt("Would you like to hit or stay? (h/s)")
    answer = gets.chomp.downcase
    unless CHOICES.include?(answer)
      prompt("Wrong input. Please type again. (h/s)")
      answer = gets.chomp.downcase
    end

    system('clear')

    break if CHOICES[2..3].include?(answer) # s, stay

    next unless CHOICES[0..1].include?(answer) # h, hit
    hit(game_desk, player_hand)
    see_card(player_hand)
    break if busted?(player_hand)
    show_partial_hand(dealer_hand)
    show_player_hand(player_hand)
  end

  if busted?(player_hand)
    show_player_hand(player_hand)
  else
    see_hidden_card(dealer_hand)
    show_dealer_hand(dealer_hand)
    show_player_hand(player_hand)
    dealer_turn(game_desk, dealer_hand)
  end

  display_results(player_hand, dealer_hand)

  if won?(player_hand, dealer_hand)
    player_score += 1
  elsif won?(dealer_hand, player_hand)
    dealer_score += 1
  end

  puts "Your score : #{player_score}. \nDealer score : #{dealer_score}\n "
  break if player_score == 3 || dealer_score == 3
end

if player_score > dealer_score
  prompt("Congratulations ! you won the overall game.")
else
  prompt("Dealer won the overall game.")
end
