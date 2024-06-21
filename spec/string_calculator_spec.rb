# frozen_string_literal: true

# spec/string_calculator_spec.rb
require_relative '../string_calculator'

RSpec.describe StringCalculator do
  describe 'performing addition' do
    context 'when given an empty string' do
      it 'returns 0' do
        expect(StringCalculator.add('')).to eq(0)
      end
    end

    context 'when given a single number inside the string' do
      it 'return 1' do
        expect(StringCalculator.add('1')).to eq(1)
      end
    end

    context 'when given 2 comma seperated value' do
      it 'return addition of that value' do
        expect(StringCalculator.add('4,5')).to eq(9)
      end
    end

    context 'when given multiple comma seperated values' do
      it 'return sum of all values' do
        expect(StringCalculator.add('4,6,0,8')).to eq(18)
      end
    end

    context 'when given new lines and comma separated values' do
      it 'return sum of all values' do
        expect(StringCalculator.add("1\n5,3,8")).to eq(17)
      end
    end

    context 'when given value containing delimeter' do
      it 'return sum of all values' do
        expect(StringCalculator.add("//;\n1;2")).to eq(3)
      end
    end

    context 'handle single negative value' do
      it 'raises an error for negative numbers' do
        expect do
          StringCalculator.add('-1')
        end.to raise_error('negative numbers not allowed please give positive number -1')
      end
    end

    context 'handle multiple negative value' do
      it 'raises an error for negative numbers' do
        expect do
          StringCalculator.add("1\;-4\n-3")
        end.to raise_error('negative numbers not allowed please give positive number -3')
      end
    end

    context 'hnadle custom delimeter multiple each value' do
      it 'return multiply of each value' do
        expect(StringCalculator.add("**\n4*2*3")).to eq(24)
      end
    end
  end
end
