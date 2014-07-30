# Blackjack

# first, we have a deck of 52 cards (how to organize data?)
#   - suits value worth 10
#   - aces value worth 11 or 1

# dealer is dealt 2 cards at random
# player is dealt 2 cards at 

# player goes: choose hit or stay
#   - if hit, dealt another card (until stay)
#     - take sum of cards
#       - if sum more than 21, player bust
#   - if stay, take total sum of cards

# dealer goes: choose hit or stay
#   - if sum of cards <= 17, hit
#   - if sum more than 21, dealer bust
#   - else stay

# - compare sum of player and dealer

require 'pry' 

puts "--------------------"
puts "Welcome to Blackjack"
puts "--------------------"

# shuffle deck

suits = ["s", "d", "c", "h"]
numbers = ["A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K"]

cards = suits.product(numbers)
cards.shuffle!

# count method

def count(hand)
  # pass in [["c", 3], ["d", 8]..] trying to get 11
  # if aces, = 1 or 11, JQK = 10

  sum = 0
  arr = hand.map { |e| e[1]}

  arr.each do |v|
    if v == "A"
      sum += 11
    elsif v == "J" || v == "Q" || v == "K"
      sum += 10
    else
      sum += v.to_i
    end
  end

  arr.select { |e| e == "A"}.count.times do
    if sum > 21
      sum -=10
    end    
  end

  sum
end

# deal cards

player_hand =[]
dealer_hand = []

2.times do
  player_hand.push(cards.shift)
end

2.times do
  dealer_hand.push(cards.shift)
end

player_total = count(player_hand)
dealer_total = count(dealer_hand)

puts "Dealer is dealt cards #{dealer_hand} with a count of #{dealer_total}"
puts "You are dealt cards #{player_hand} with a count of #{player_total}"
puts "--------------------"

# game play

# win automatically if blackjack

if dealer_total == 21
  puts "Dealer got blackjack! Dealer wins!"
  exit
elsif player_total == 21
  puts "You got blackjack! Player wins!"
  exit
end

# player goes

puts "Would you like to hit(H) or stay(S)?"
player_choice = gets.chomp.downcase

while player_choice == "h"
    player_hand.push(cards.shift)
    player_total = count(player_hand)
    if player_total > 21
      puts "Your hand is now #{player_hand} and your count is #{player_total}. You bust!"
      exit
    elsif player_total == 21
      puts "Your hand is now #{player_hand} and your count is #{player_total}. You win!"
      exit
    else
      puts "Your hand is now #{player_hand} and your count is #{player_total}. Would you like to hit or stay?"
    end
    player_choice = gets.chomp.downcase
end 

if player_choice == "s"
  player_total = count(player_hand)
  puts "Your hand is final at #{player_hand} with a count of #{player_total}"
end

# dealer goes!!

while dealer_total < 17
  puts "Dealer hits"
  dealer_hand.push(cards.shift)
  dealer_total = count(dealer_hand)
  puts "Dealer's hand is now #{dealer_hand} with a count of #{dealer_total}"
end

if dealer_total > 21
  puts "Dealer busts! You win!"
  exit
elsif dealer_total == 21
  puts "Dealer's hand is now #{dealer_hand}. Dealer wins!"
  exit
else
  puts "Dealer chooses to stay with cards of #{dealer_hand} and a count of #{dealer_total}"
end

# compare player vs dealer if both stay

if dealer_total > player_total
  puts "Dealer wins!"
  exit
elsif dealer_total < player_total
  puts "You win!"
  exit
else
  puts "It's a tie!"
  exit
end
  
