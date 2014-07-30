# Tic Tac Toe - try on your own

# pseudo-code

# first draw board
# assign player1 to x
# assign player2 to o

# loop until there is a winner or all squares are taken
  # player1 picks empty square
  # player2 picks empty square
  # etc.
  # check for winner

# if there's a winner
  # show winner
# else
  # tie
require 'pry'

def initialize_board
  b = {1 => "", 2 => "", 3 => "", 4 => "", 5 => "", 6 => "", 7 => "", 8 => "", 9 => ""}
  b
end

def draw_board(b)
  system'clear'
puts " #{b[1]}  | #{b[2]}   |  #{b[3]}  "
puts " ---------------------------------"
puts " #{b[4]}  | #{b[5]}   |  #{b[6]}  "  
puts " ---------------------------------"
puts " #{b[7]}  | #{b[8]}   |  #{b[9]}  "
end

def empty_squares(b)
  b.select {|k,v| b[k] == ""}.keys
end

def player_goes(b)
  puts "Enter the space where you want to go (1-9)"
  player_choice = gets.chomp.to_i
  b[player_choice] = "X"
end

def computer_goes(b)
  computer_choice = empty_squares(b).sample
  b[computer_choice] = "O"
end

board = initialize_board

begin
  player_goes(board)
  draw_board(board)
  computer_goes(board)
  draw_board(board)
end until empty_squares(board).empty?