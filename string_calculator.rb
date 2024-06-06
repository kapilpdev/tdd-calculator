class StringCalculator

	def self.add(input)
		return 0 if input.empty?
		value  = handling_separated_value(input)
		addition_of_values(value)
	end

	private
	def self.handling_separated_value(input)
		input.split(/[,\n]/)
	end

	def self.addition_of_values(value)
		value.map(&:to_i).sum
	end
end
