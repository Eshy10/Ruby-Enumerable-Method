require "./lib/enumerable_method"

describe Enumerable do
    describe "#my_each" do
      it "should return each element in an array" do
          expect(([2, 4, 6]).my_each { |num| puts num}).to eq([2, 4, 6])
      end
    end

    describe "my_each_with_index" do
        it "should return each element in an array with their index" do
            expect((['apple', 'kiwi', 'grapes']).my_each_with_index { |val, index| puts "#{val} => #{index}"}).to eq(['apple', 'kiwi', 'grapes'])
        end
    end
end