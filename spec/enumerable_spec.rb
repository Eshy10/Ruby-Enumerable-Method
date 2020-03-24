require './lib/enumerable_method'
# rubocop:disable Layout/LineLength

describe Enumerable do
  describe '#my_each' do
    it 'should return each element in an array' do
      expect([2, 4, 6].my_each { |num| puts num }).to eq([2, 4, 6])
    end
  end

  describe 'my_each_with_index' do
    it 'should return each element in an array with their index' do
      expect(%w[apple kiwi grapes].my_each_with_index { |val, index| puts "#{val} => #{index}" }).to eq(%w[apple kiwi grapes])
    end
  end

  describe 'my_select' do
    it 'should return a new array that satisfy the condition in the block' do
      expect([1, 2, 3, 4, 5, 6].my_select(&:even?)).to eq([2, 4, 6])
      expect([1, 2, 3, 4, 5, 6].my_select(&:odd?)).to eq([1, 3, 5])
    end
  end

  describe 'my_all?' do
    it 'should return true if the block does not return false' do
      expect([3, 5, 7].my_all?(&:odd?)).to eq(true)
    end

    context 'when all elements of the matches the pattern given' do
      it 'should return true' do
        expect(%w[bat dog cat].my_all?(String)).to eq(true)
        expect([1, 2].all?(Integer)).to eq(true)
      end
    end

    context 'when at the array is empty' do
      it 'should return true' do
        expect([].all?).to eq(true)
      end
    end

    context 'when at least 1 of the elements of the array is false when passed into the block' do
      it 'should return false' do
        expect([-8, -9, -6, 0].my_all? { |num| num < 0 }).to eq(false)
        expect(%w[bat dog cat].my_all?(/t/)).to eq(false)
        expect([3, 5, 8, 11].my_all?(&:odd?)).to eql(false)
      end
    end
  end

  describe 'my_any?' do
    it 'should return true if any element is true' do
      expect([3, 4, 6, 5, 7].my_any?(&:odd?)).to eq(true)
    end

    context 'when any elements of the matches the pattern given' do
      it 'should return true' do
        expect(%w[bat dog cat].my_any?(String)).to eq(true)
        expect([1, 2, 'hello'].my_any?(Integer)).to eq(true)
      end
    end

    context 'when at the array is empty' do
      it 'should return false' do
        expect([].any?).to eq(false)
      end
    end

    context 'when all of the elements of the array is false when passed into the block' do
      it 'should return false' do
        expect([8, 9, 6, 0].my_any? { |num| num < 0 }).to eq(false)
        expect(%w[baby dog girl].my_any?(/t/)).to eq(false)
        expect([2, 6, 8, 10].my_any?(&:odd?)).to eql(false)
      end
    end
  end

  describe 'my_none?' do
    it 'should return true if none of the element is true' do
      expect([2, 4, 6].my_none?(&:odd?)).to eq(true)
    end

    context 'when all elements of the matches the pattern given' do
      it 'should return false' do
        expect(%w[bat dog cat].my_none?(String)).to eq(false)
        expect([1, 2].none?(Integer)).to eq(false)
      end
    end

    context 'when at the array is empty' do
      it 'should return true' do
        expect([].none?).to eq(true)
      end
    end

    context 'when at least 1 of the elements of the array is true when passed into the block' do
      it 'should return false' do
        expect([-8, -9, -6, 0].my_none? { |num| num < 0 }).to eq(false)
        expect(%w[bat dog cat].my_none?(/t/)).to eq(false)
        expect([3, 5, 8, 11].my_none?(&:odd?)).to eql(false)
      end
    end
  end

  describe 'my_count' do
    it 'should return the number of element in an array' do
      expect([3, 5, 7].my_count).to eq(3)
    end

    it 'should return the count of the arg given' do
      expect([-8, -9, -6, 0].my_count { |num| num < 0 }).to eq(3)
      expect([3, 5, 3, 7].my_count(3)).to eq(2)
      expect([2, 5, 8, 11].my_count(&:even?)).to eql(2)
    end
  end

  describe 'my_map' do
    it 'should return a new array that satisfies the condition in the block' do
      expect([2, 4, 6].my_map { |num| num * 3 }).to eq([6, 12, 18])
      expect(%w[hi hello holla].my_map(&:upcase)).to eq(%w[HI HELLO HOLLA])
      expect([2, 5, 8].my_map(&:even?)).to eql([true, false, true])
    end
  end

  describe 'my_inject' do
    it 'should use the initial element as the first and return the total' do
      expect([2, 4, 6].my_inject { |sum, n| sum + n }).to eq(12)
      expect([2, 4, 6].my_inject { |product, n| product * n }).to eq(48)
    end

    it 'should accept a symbol and also accept a symbol with an integer' do
      expect((5..10).my_inject(:+)).to eq(45)
      expect((5..10).my_inject(2, :*)).to eq(302_400)
    end
  end
end
# rubocop:enable Layout/LineLength