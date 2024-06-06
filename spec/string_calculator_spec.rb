# spec/string_calculator_spec.rb
require_relative '../string_calculator'

RSpec.describe StringCalculator do
  describe 'performing addition' do
    context 'when given an empty string' do
      it 'returns 0' do
        expect(StringCalculator.add("")).to eq(0)
      end
    end

    context 'when given a single number inside the string' do
      it 'return 1' do
        expect(StringCalculator.add("1")).to eq(1)
      end
    end

    context 'when given 2 comma seperated value' do
      it 'return addition of that value' do
        expect(StringCalculator.add("4,5")).to eq(9)
      end
    end
  end
end
