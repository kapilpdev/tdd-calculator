# frozen_string_literal: true

class StringCalculator
  def self.add(input)
    return 0 if input.empty?

    numbers = extract_numbers(input)
    validate_no_negative_numbers(numbers)
    if custom_delimiter_with_estric(input)
      multiply_values(numbers)
    else
      sum_of_values(numbers)
    end
  end

  def self.extract_numbers(input)
    if custom_delimiter?(input) || custom_delimiter_with_estric(input)
      delimiter, numbers = extract_custom_delimiter(input)
      split_numbers(numbers, delimiter)
    else
      split_numbers(input)
    end
  end

  def self.custom_delimiter_with_estric(input)
    input.start_with?('**')
  end

  def self.custom_delimiter?(input)
    input.start_with?('//')
  end

  def self.extract_custom_delimiter(input)
    match = if input.start_with?('//')
              input.match(%r{//(.+)\n(.*)})
            else
              input.match(/(.+)\n(.*)/)
            end
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

  def self.multiply_values(values)
    numeric_values = values.map { |value| value.split('*').map(&:to_i).reduce(1, :*) }

    numeric_values.empty? ? 0 : numeric_values.reduce(1, :*)
  end
end
