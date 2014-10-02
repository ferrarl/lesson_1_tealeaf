# get players name
# create a deck of cards
# deal cards
# allow player to hit or stay
# if player hits deal one more card
# if player stays, becomes dealers turn
# if player went above 21, player busts and loses
# dealer will hit until cards total 17
# once dealer is above 17, dealer will stay
# if dealer goes above 21 dealer bust and loses
# if both player and dealer have the same number its a tie
# whoever is closes to 21 without going over wins
# ask to play again

def calculate_cards(cards)
  arr = cards.map{|e| e[1]}
  
  total = 0
  arr.each do |value|
  if value == "Ace"
    total += 11
  elsif value == "King" || value == "Queen" || value == "Jack" 
    total += 10
  else 
    total += value.to_i
  end
  end
      
  arr.select {|e| e == "Ace"}.count.times do
    total -= 10 if total > 21
  end
  total
end


      
    
  
puts "Welcome to Blackjack"

puts "What is your name"
player = gets.chomp.capitalize!
puts "Lets play some Blackjack #{player}!"

cards = ["1","2","3","4","5","6","7","8","9","10","Jack","Queen","King","Ace"]
suits = ["Spades","Hearts","Clubs","Diamonds"]
deck = suits.product(cards)

loop do
  
deck.shuffle!

players_cards = []
dealers_cards = []

players_cards << deck.pop
dealers_cards << deck.pop
players_cards << deck.pop
dealers_cards << deck.pop

  

dealertotal= calculate_cards(dealers_cards)

playerstotal= calculate_cards(players_cards)

puts "#{player} your cards are #{players_cards} which totals to #{playerstotal}"

puts "The Dealers cards are #{dealers_cards} which totals to #{dealertotal}"

puts "#{player} would you like to hit? (y/n)"
hit_stay = gets.chomp.downcase



while hit_stay == "y"
  players_cards << deck.pop
  playerstotal= calculate_cards(players_cards)
  puts "Your cards now are #{players_cards} which totals to #{playerstotal}"
break if playerstotal > 21
  puts "#{player} would you like to hit? (y/n)"
  hit_stay = gets.chomp.downcase
end

if hit_stay == "n"
  puts "Player stays at #{playerstotal}"
  puts "Now it is the dealers turn"
else

end


 while dealertotal < 17
  dealers_cards << deck.pop
  puts "Dealer hit"
  dealertotal = calculate_cards(dealers_cards)
  puts "Dealers cards are now #{dealers_cards} which totals to #{dealertotal}"
  break if dealertotal > 21
  end

if playerstotal > 21
  puts "#{player} Busted"
 elsif dealertotal > 21
  puts "Dealer Busted"
 elsif playerstotal == dealertotal
  puts "Tie"
 elsif playerstotal <= 21 && playerstotal > dealertotal
  puts "#{player} Won!"
 else
  puts "Dealer Won"
end

puts "Play again? (y/n)"
play_again= gets.chomp.downcase
break if play_again == "n"
end
