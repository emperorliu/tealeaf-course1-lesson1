# Create a method that takes an array as a parameter

a = [1,2,3,4,5,5,4]

def method(obj)
	obj.uniq
end

method(a)
p a

# Doesn't mutate caller, the outer variable remains unchanged.

def method(obj)
	obj.uniq!
end

method(a)
p a 

# Mutates caller, the outer variable is being changed.