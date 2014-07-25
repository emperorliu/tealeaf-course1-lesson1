# Create a local variable and modify it at an inner scope.

a = [1,2,3,4,5]

3.times do |n|
	a = 4
end

# I modified it in the times method scope by reassigning the variable to 4

puts a

# Create a local variable at an inner scope and try to reference it in the outer scope.

a = [1,2,3,4,5]

3.times do |n|
	b = 6
end

puts b

# What happens when you have nested do/end blocks?

# I would believe that with nested do/end blocks, it would depend on what scope the do/end block
# encapsulates, like a russian doll. If it's the inner-most block, then it has access to all the
# variables in the outer scopes.