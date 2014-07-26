# Rock, Paper, Scissors

# You pick rock, paper or Scissors
# Computer picks rock, paper or Scissors

# If you pick rock and computer picks scissors, computer wins
# ..etc

# If you want to play again, loop back again.

puts "Play Rock Paper Scissors!"

selection = {"p" => "Paper", "r" => "Rock", "s" => "Scissors"}

loop do

  puts "Choose one: (P/R/S)"

  yourpick = gets.chomp.downcase
  comppick = selection.keys.sample

  puts "You picked #{selection[yourpick]} and computer picked #{selection[comppick]}"

  if yourpick == "r"
    case yourpick == "r"
    when comppick == "p"
      puts "You lose!"
    when comppick == "s"
      puts "You win!"
    else comppick == "r"
      puts "You tied, try again!"
    end

  elsif yourpick == "p"   
    case yourpick == "p"
    when comppick == "r"
      puts "You win!"
    when comppick == "s"
      puts "You lose!"
    else comppick == "p"
      puts "You tied, try again!"
    end

  else
    case yourpick == "s"
    when comppick == "p"
      puts "You win!"
    when comppick == "r"
      puts "You lose!"
    else comppick == "s"
      puts "You tied, try again!"
    end
  end

  puts "Play again? (Y/N)"
  break if gets.chomp.downcase != "y"
end

puts "Good bye!"

