module Enumerable
	def my_each
		return self unless block_given?
		for	element in self
			yield(element)
		end
		# return list
	end

	def my_each_with_index
		return self unless block_given?
		for i in 0..self.length-1
			yield(i,self[i])
		end
	end

	def my_select
		return self unless block_given?
		result =[]
		self.my_each { |e|
			result << e if yield(e)
		}
		return result
	end

	def my_all?
		return true unless block_given?
		result = true
		self.my_each { |e|
			unless yield(e)
				result = false
				break
			end
		}
		return result
	end

	def my_any?
		return true unless block_given?
		result = false
		self.my_each { |e|
			if yield(e)
				result = true
				break
			end
		}
		return result		
	end

	def my_none?
		return false unless block_given?
		result = true
		self.my_each { |e|
			if yield(e)
				result = false
				break
			end
		}
		return result
	end

	def my_count(x=self.length)
		sum = 0
		if block_given?
			self.my_each { |e|
				sum +=1 if yield(e)
			}
		else
			self.my_each { |e| 
				sum += 1 if e == x
			}
		end
		
		return sum
	end

	def my_map(&myproc = nil)
		# return self unless block_given? || myproc
		result = []
		if myproc && block_given?
			self.my_each{ |e| result << yield(myproc.call(e))}
		elsif block_given? 
			self.my_each{ |e| result << myproc.call(e)}
		elsif myproc
			self.my_each{ |e| result << yield(e)}

		else
			return self
		end
		return result
	end

	def my_inject(input=nil)
		accomulator = input.nil? ? first : input
		new_list = []
		# self.to_a if self.class == Range
		if input.nil?
			new_list = self.my_select{ |e| self.index(e) > 0}
		else
			new_list = self
		end

		new_list.my_each{ |e| accomulator = yield(accomulator, e)}

		return accomulator
	end

	

end

def multiply_els(list)
	list.my_inject {|memo, e| memo * e }
end