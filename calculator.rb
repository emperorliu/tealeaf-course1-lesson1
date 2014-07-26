# Calculator

# User inputs a number
# User inputs a second number
# User inputs an operator

def say(msg)
  puts "#{msg}"
end

say("Please enter the first number:")
num1 = gets.chomp

say("Please enter the second number:")
num2 = gets.chomp

say("Please choose the operator: 1 -- Add, 2 -- Subtract, 3 -- Multiply, 4 -- Divide")
operator = gets.chomp.to_i

if operator == 1
  result = num1.to_i + num2.to_i
elsif operator == 2
  result = num1.to_i - num2.to_i
elsif operator == 3
  result = num1.to_i * num2.to_i
else
  result = num1.to_f / num2.to_f

end

puts "Result is #{result}"