# frozen_string_literal: true

class StringCalculator
  def self.add(input)
    return 0 if input.empty?

    numbers = extract_numbers(input)
    validate_no_negative_numbers(numbers)

    sum_of_values(numbers)
  end

  private

  def self.extract_numbers(input)
    if custom_delimiter?(input)
      delimiter, numbers = extract_custom_delimiter(input)
      split_numbers(numbers, delimiter)
    else
      split_numbers(input)
    end
  end

  def self.custom_delimiter?(input)
    input.start_with?("//")
  end

  def self.extract_custom_delimiter(input)
    match = input.match(%r{//(.+)\n(.*)})
    delimiter = Regexp.escape(match[1])
    numbers = match[2]
    [delimiter, numbers]
  end

  def self.split_numbers(input, delimiter = /[,\n]/)
    input.split(delimiter)
  end

  def self.sum_of_values(values)
    values.map(&:to_i).sum
  end

  def self.validate_no_negative_numbers(values)
    negatives = values.map(&:to_i).select(&:negative?)
		raise "negative numbers not allowed please give positive number #{negatives.join(', ')}" unless negatives.empty?
  end
end
