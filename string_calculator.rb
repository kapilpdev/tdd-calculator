require 'pry-nav'

class StringCalculator

	def self.add(input)
		return 0 if input.empty?
		if input.start_with?("//")
			value = handle_delimeter(input)
		else
			value  = handling_separated_value(input)
		end
		validate_no_negative_numbers(value)
    sum_of_values(value)
	end

	private
	def self.handle_delimeter(value)
		delimiter, numbers = custom_delimiter(value)
    numbers.split(delimiter)
	end

	def self.custom_delimiter(input)
		match = input.match(%r{//(.+)\n(.*)})
		delimiter = Regexp.escape(match[1])
		numbers = match[2]
		[delimiter, numbers]
	end

	def self.handling_separated_value(input)
		input.split(/[,\n]/)
	end

	def self.sum_of_values(values)
    values.map(&:to_i).sum
  end

  def self.validate_no_negative_numbers(values)
    negatives = values.map(&:to_i).select(&:negative?)
    raise "negative numbers not allowed please give positive number #{negatives.join(', ')}" unless negatives.empty?
  end
end
