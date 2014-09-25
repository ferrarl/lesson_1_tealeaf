
CHOICE = {"p" => "Paper", "r" => "Rock", "s" => "Scissors"}

puts "Lets Play Rock, Paper, Scissors!"

def winner(winning_choice)
    case winning_choice
    when "p"
      puts "Paper burned rock"
    when "r"
      puts "Rock smashed scissors"
    when "s"
        puts "Scissors shredded paper"
    end
end
    
      
loop do
  begin

    puts "What do you choose? (p, r, or s)"
    user_choice = gets.chomp.downcase
  end until CHOICE.keys.include?(user_choice)
    
  computer_choice = CHOICE.keys.sample
  
  
    
    if user_choice == computer_choice
        puts "Tie"
    elsif (user_choice == "r" && computer_choice == "s") || (user_choice == "p" && computer_choice == "r") || (user_choice == "s" && computer_choice == "p")
        puts "You Win!"
        winner(user_choice)
    else 
        puts "You Lost!"
        winner(computer_choice)
    end
    
  
  puts "Play again (y/n)"
  break if gets.chomp.downcase != 'y'
  
end

puts "Goodbye!"
