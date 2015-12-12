def bubble_sort(array=[4,3,78,2,0,2])
	is_sorted = false
	a = array
	n=1
	while is_sorted == false
		
		is_sorted = true
		i=0
		
		while i < (a.length - n)

			if a[i] > a[i+1]
				a[i], a[i+1] = a[i+1], a[i]
				is_sorted = false
			end
			puts a.inspect + " " + n.to_s + is_sorted.to_s

			i += 1	
		end
		n += 1
	end
	return a
end

# puts bubble_sort()

def bubble_sort_by(array)
	is_sorted = false
	a = array
	n=1
	while !is_sorted
		i = 0
		is_sorted = true
		while i < (a.length - n)
			if yield(a[i],a[i+1]) > 0
				a[i], a[i+1] = a[i+1], a[i]
				is_sorted = false
			end
			i += 1	
		end
		n += 1
	end
	return a
end

puts
