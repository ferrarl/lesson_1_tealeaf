def say(msg)
    puts "=> #{msg}"
end




say "What's the first number?"
num1 = gets.chomp

say "What's the second number?"
num2 = gets.chomp

say "Would you like to +,-,*, or /?"
operator= gets.chomp

if operator == "+"
    result = num1.to_i + num2.to_i
  elsif operator == "-"
    result = num1.to_i - num2.to_i
  elsif operator == "*"
    result = num1.to_i * num2.to_i
  else operator == "/"
    result = num1.to_f / num2.to_f 
end

say "Your result is #{result}"

