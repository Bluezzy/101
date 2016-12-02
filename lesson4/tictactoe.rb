WINNING_LINES = { line1: [1, 2, 3],
                  line2: [4, 5, 6],
                  line3: [7, 8, 9],
                  column1: [1, 4, 7],
                  column2: [2, 5, 8],
                  column3: [3, 6, 9],
                  diag1: [1, 5, 9],
                  diag2: [3, 5, 7] }.freeze

TURN_CHOICES = {  computer: %w(c computer opponent him you O),
                  player: %w(m me player X myself) }.freeze

GAME_CHOICES = { restart: %w(y yes sure again restart play),
                 quit: %w(n no quit stop over bye) }.freeze

def full_line?(board, mark)
  WINNING_LINES.values.each do |line|
    total_marks = []
    line.each do |square|
      total_marks << board[square]
    end
    return true if total_marks.count(mark) == 3
  end
  false
end

def prompt(message)
  puts "==>>> #{message}"
end

def empty_squares(board)
  board.keys.select { |square| board[square] == ' ' }
end

def best_square(brd, marker)
  WINNING_LINES.values.each do |line|
    board_line = {}
    line.each { |square| board_line[square] = brd[square] }
    if board_line.values.count(marker) == 2 && board_line.values.count(' ') == 1
      return board_line.key(' ')
    end
  end
  false
end

def winning_choice(brd)
  best_square(brd, 'O')
end

def defensive_choice(brd)
  best_square(brd, 'X')
end

def center_square_move(board)
  5 if empty_squares(board).include?(5)
end

def computer_moves(board)
  square = winning_choice(board)
  square = defensive_choice(board) unless square
  square = center_square_move(board) unless square
  square = empty_squares(board).sample unless square
  board[square] = 'O'
end

def joinor(array, delimiter = ',', joining_word = 'or')
  if array.size > 1
    "#{array[0..-2].join(delimiter + ' ')} #{joining_word} #{array.last}"
  else
    array.first.to_s
  end
end

def draw_board(any_board)
  puts "___________________"
  puts "|     |     |     |"
  puts "|  #{any_board[1]}  |  #{any_board[2]}  |  #{any_board[3]}  |"
  puts "|     |     |     |"
  puts "|-----------------|"
  puts "|     |     |     |"
  puts "|  #{any_board[4]}  |  #{any_board[5]}  |  #{any_board[6]}  |"
  puts "|     |     |     |"
  puts "|-----------------|"
  puts "|     |     |     |"
  puts "|  #{any_board[7]}  |  #{any_board[8]}  |  #{any_board[9]}  |"
  puts "|     |     |     |"
  puts "|_________________|"
end

def initialize_board
  { 1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ',
    6 => ' ', 7 => ' ', 8 => ' ', 9 => ' ' }
end

puts "===================== Welcome to Tic Tac Toe ! =========================="

player_score = 0
computer_score = 0
  
loop do
  board = initialize_board
  answer = ''

  prompt("Who should start to play ? ('c' for computer/'m' for me)")
  choice = gets.chomp.downcase
  unless TURN_CHOICES.values.flatten.include?(choice)
    prompt("Wrong input. Please type again.(c/m)")
    choice = gets.chomp.downcase
  end

  system('clear')

  board[5] = 'O' if TURN_CHOICES[:computer].include?(choice)

  draw_board(board)

  loop do
    prompt("Which square would you like to mark?" \
    " #{joinor(empty_squares(board), ',', 'and')}.")
    player_square = gets.chomp.to_i

    if board[player_square] != ' '
      prompt("Wrong input. Please try again.")
      next
    end

    system('clear')

    board[player_square] = 'X'
    if full_line?(board, 'X')
      draw_board(board)
      player_score += 1
      prompt("You won.")
      break
    end

   computer_moves(board)
    if full_line?(board, 'O')
      draw_board(board)
      computer_score += 1
      prompt("Computer won.")
      break
    end
    draw_board(board)

    if empty_squares(board).size.zero?
      prompt("It's a tie")
      break
    end
  end

  puts "Your score : #{player_score}. Computer score : #{computer_score}"
  if computer_score == 3 && player_score == 3
    prompt("Very tense match ! No winner. ")
    break
  elsif computer_score >= 3
    prompt("Game over. No one can beat the computer !")
    break
  elsif player_score >= 3
    prompt("Congratulations ! You're the best, no doubt about it.")
    break
  end

  puts "Do you want to play again ?"
  while !GAME_CHOICES.include?(answer)
    answer = gets.chomp.downcase
    if GAME_CHOICES[:quit].include?(answer)
      system('clear')
      prompt("Thanks for playing. Bye !")
      break
    elsif GAME_CHOICES[:restart].include?(answer)
      prompt("All right !")
      break
    else
      prompt("I don't understand. Please type again.(yes/no)")
    end
  end

  break if GAME_CHOICES[:quit].include?(answer)
end
