def game_analysis(board, mark)
  winning_lines = { line1: { 1 => board[1], 2 => board[2], 3 => board[3] },
                    line2: { 4 => board[4], 5 => board[5], 6 => board[6] },
                    line3: { 7 => board[7], 8 => board[8], 9 => board[9] },
                    column1: { 1 => board[1], 4 => board[4], 7 => board[7] },
                    column2: { 2 => board[2], 5 => board[5], 8 => board[8] },
                    column3: { 3 => board[3], 6 => board[6], 9 => board[9] },
                    diag1: { 1 => board[1], 5 => board[5], 9 => board[9] },
                    diag2: { 3 => board[3], 5 => board[5], 7 => board[7] } }
  winning_lines.each do |_, squares|
    if squares.values.count(mark) == 3 # full line
      return 'over' # game is over
    end
  end
  winning_lines.each do |_, squares|
    if squares.values.count(mark) == 2 && squares.values.count(' ') == 1
      return squares.key(' ') # computer understand the threat for both players.
    end
  end
  'nothing found' # game continues
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

player_score = 0.0
computer_score = 0.0
starting_board = {}

loop do
  answer = ''
  puts "who should start to play ? (computer/me)"
  choose = gets.chomp
  if choose == 'me'
    starting_board = { 1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ',
                       6 => ' ', 7 => ' ', 8 => ' ', 9 => ' ' }
    choices = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  elsif choose == 'computer'
    starting_board = { 1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => 'O',
                       6 => ' ', 7 => ' ', 8 => ' ', 9 => ' ' }
    choices = [1, 2, 3, 4, 6, 7, 8, 9]
  else
    puts "Wrong answer. Please type again(computer/me)."
    redo
  end

  updated_board = starting_board.clone
  draw_board(starting_board)

  loop do
    puts "Which square would you like to mark? #{joinor(choices, ',', 'and')}."
    player_square = gets.chomp.to_i
    if choices.include?(player_square) == false
      puts "please try again"
      redo
    end

    updated_board[player_square] = 'X'
    choices.delete(player_square)
    if game_analysis(updated_board, 'X') == 'over'
      draw_board(updated_board)
      player_score += 1
      puts "You won."
      break
    end

    if game_analysis(updated_board, 'O') == 'nothing found'
      if game_analysis(updated_board, 'X') == 'nothing found'
        computer_square = choices.include?(5) ? 5 : choices.sample
      else
        computer_square = game_analysis(updated_board, 'X') # defensive move
      end
    else
      computer_square = game_analysis(updated_board, 'O') # offensive move
    end

    updated_board[computer_square] = 'O'
    choices.delete(computer_square)
    if game_analysis(updated_board, 'O') == 'over'
      draw_board(updated_board)
      computer_score += 1
      puts "Computer won."
      break
    end
    draw_board(updated_board)

    if choices.empty?
      puts "It's a tie"
      computer_score += 0.5
      player_score += 0.5
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
