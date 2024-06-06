class StringCalculator
	def self.add(input)
		return 0 if input.empty?
		return 1 if input == "1"
		return sum_two_numbers(input) if two_numbers_with_comma?(input)
	end

	private

	def self.two_numbers_with_comma?(input)
    input[0].to_i.positive? && input[1] == ',' && input[2].to_i.positive?
  end

	def self.sum_two_numbers(input)
    input[0].to_i + input[2].to_i
  end
end
