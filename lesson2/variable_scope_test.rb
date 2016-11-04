vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 
	'motorcycle', 'motorcycle', 'car', 'truck']

def count_occurences(array)
	sorted_array = array.sort
	occurences = {}
	sorted_array.each do |element|
		if occurences.has_key?(element)
			occurences[element] += 1
		else
			occurences[element] = 1
		end
	end
	occurences
end

p count_occurences(vehicles)

