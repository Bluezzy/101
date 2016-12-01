WINNING_LINES = { line1: [1, 2, 3],
                  line2: [4, 5, 6],
                  line3: [7, 8, 9],
                  column1: [1, 4, 7],
                  column2: [2, 5, 8],
                  column3: [3, 6, 9],
                  diag1: [1, 5, 9],
                  diag2: [3, 5, 7] }.freeze

def full_line?(board, mark) # take 'X' (player) or 'O' (computer) as a second
  # argument and determines if there is a full line
  WINNING_LINES.values.each do |line|
    total_marks = []
    line.each do |square|
      total_marks << board[square]
    end
    return true if total_marks.count(mark) == 3
  end
  false
end

def empty_squares(board)
  board.keys.select { |square| board[square] == ' ' }
end

def smart_choice(board, mark) # makes computer see if there is a threat
  # for both sides and makes a move accordingly.
  WINNING_LINES.values.each do |line|
    board_line = {}
    line.each do |square|
      board_line[square] = board[square]
    end
    if board_line.values.count(mark) == 2 && board_line.values.count(' ') == 1
      return board_line.key(' ') # pick the empty square if there is a threat.
    end
  end
  false
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

player_score = 0
computer_score = 0
starting_board = {}

loop do
  starting_board = { 1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ',
                     6 => ' ', 7 => ' ', 8 => ' ', 9 => ' ' }
  answer = ''
  updated_board = starting_board.clone
  puts "Who should start to play ? ('c' for computer/'m' for me)"
  choose = gets.chomp
  unless choose == 'm' || choose == 'c'
    puts "Wrong input. Please type again.(c/m)"
    choose = gets.chomp
  end

  system('clear')

  if choose.casecmp == 'c'
    updated_board[5] = 'O'
    draw_board(updated_board)
  end

  draw_board(updated_board)

  loop do
    puts "Which square would you like to mark?" \
    " #{joinor(empty_squares(updated_board), ',', 'and')}."
    player_square = gets.chomp.to_i

    if updated_board[player_square] != ' '
      puts "please try again"
      next
    end

    system('clear')

    updated_board[player_square] = 'X'
    if full_line?(updated_board, 'X')
      draw_board(updated_board)
      player_score += 1
      puts "You won."
      break
    end

    if smart_choice(updated_board, 'O') == false
      if smart_choice(updated_board, 'X') == false
        computer_square = empty_squares(updated_board).include?(5) ?
        5 : empty_squares(updated_board).sample
      else
        computer_square = smart_choice(updated_board, 'X') # defensive move
      end
    else
      computer_square = smart_choice(updated_board, 'O') # offensive move
    end

    updated_board[computer_square] = 'O'
    if full_line?(updated_board, 'O')
      draw_board(updated_board)
      computer_score += 1
      puts "Computer won."
      break
    end
    draw_board(updated_board)

    if empty_squares(updated_board).size.zero?
      puts "It's a tie"
      break
    end
  end

  puts "Your score : #{player_score}. Computer score : #{computer_score}"
  if computer_score == 3 && player_score == 3
    puts "Very tense match ! No winner. "
    break
  elsif computer_score >= 3
    puts "Game over. No one can beat the computer !"
    break
  elsif player_score >= 3
    puts "Congratulations ! You're the best, no doubt about it."
    break
  end

  puts "Do you want to play again ? (y/n)"
  while (answer != 'y') || (answer != 'n')
    answer = gets.chomp
    if answer == 'n'
      puts "Thanks for playing. Bye !"
      break
    elsif answer == 'y'
      puts "All right !"
      break
    else
      puts "I don't understand. please type again.(y/n)"
    end
  end

  break if answer == 'n'
end
