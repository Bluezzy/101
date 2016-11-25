def winning_combination?(board, mark)
  case
  when board[1] == mark && board[2] == mark && board[3] == mark then true # Horizontal lines
  when board[4] == mark && board[5] == mark && board[6] == mark then true
  when board[7] == mark && board[8] == mark && board[9] == mark then true
  when board[1] == mark && board[4] == mark && board[7] == mark then true # Vertical lines
  when board[2] == mark && board[5] == mark && board[8] == mark then true
  when board[3] == mark && board[6] == mark && board[9] == mark then true
  when board[1] == mark && board[5] == mark && board[9] == mark then true # Diagonals
  when board[3] == mark && board[5] == mark && board[7] == mark then true
  else
    false
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
  puts "___________________"
end

loop do 
  empty_board = { 1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ',
                  6 => ' ', 7 => ' ', 8 => ' ', 9 => ' ' }
  updated_board = empty_board.clone
  squares = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  answer = ''
  
  draw_board(empty_board)
  
  loop do
    puts "What square would you like to mark? (1,2,3,4,5,6,7,8,9)."
    player_square = gets.chomp.to_i
    if squares.include?(player_square) == false
      puts "please try again"
      redo
    end
    
    updated_board[player_square] = 'X'
    squares.delete(player_square)
    if winning_combination?(updated_board, 'X')
      draw_board(updated_board)
      puts "Congratulations ! You won !"
      break
    end
    
    computer_square = squares.sample
    updated_board[computer_square] = 'O'
    squares.delete(computer_square)
    if winning_combination?(updated_board, 'O')
      draw_board(updated_board)
      puts "Computer won."
      break
    end
    
    draw_board(updated_board)
    if squares.empty?
      puts "It's a tie"
      break
    end
    
  end
  
  puts "Do you want to play again ? (y/n)"
  while (answer != 'y') || (answer != 'n')
    answer = gets.chomp
    if answer == 'n'
      puts "Thanks for playing. Bye."
      break
    elsif answer == 'y'
      puts "All right !"
      break
    else
      puts "I don't understand. please type again."
    end
  end
  
  break if answer == 'n'
    
end
