class StringCalculator
	
	def self.add(input)
		return 0 if input.empty?
		value = handle_comma_separated_value(input)
		addition_of_value(value)
	end

	def self.handle_comma_separated_value(input)
		input.split(',')
	end

	def self.addition_of_value(value)
		value.map(&:to_i).sum
	end
end
