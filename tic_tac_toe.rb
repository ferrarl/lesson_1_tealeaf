# tic tac toe
#1. need to create a gameboard
#2. need user to pick a location
#3. need computer to pick a location
#4. if the player or the computer get three in a row they win
require 'pry'

puts "Welcome to Tic Tac Toe"

def initialize_board
  b = {}
  (1..9).each {|position| b[position] = " "}
  b
end


def draw_board(b)
  system "clear"
  puts " #{b[1]}| #{b[2]} | #{b[3]} "
  puts "------------"
  puts " #{b[4]}| #{b[5]} | #{b[6]} "
  puts "------------"
  puts " #{b[7]}| #{b[8]} | #{b[9]} "
end

def empty_positions(b)
  b.select {|k, v| v == " " }.keys
end

def player_picks(b)
  begin
    puts "Pick a square (1-9):"
    position = gets.chomp.to_i
  end until empty_positions(b).include?(position)
    b[position] = "x"
end


def computer_picks(b)
  position = empty_positions(b).sample
  b[position] = "o"
end
 def check_winner(b)
   winning_lines= [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
   winning_lines.each do |line|
       return "Player" if b.values_at(*line).count("x") == 3
       return "Computer" if b.values_at(*line).count("o") == 3
    end
    nil
 end

  
board = initialize_board

draw_board(board)

loop do

  begin
  player_picks(board)
  computer_picks(board)
  draw_board(board)
  winner = check_winner(board)
 

  end until winner || empty_positions(board).empty? 

  if winner 
    puts "#{winner} won!!"
  else
    puts "It's a tie"
  end

puts "Play again?"
break if gets.chomp.downcase != "y"
board = initialize_board
end

puts "Thanks for playing!"
