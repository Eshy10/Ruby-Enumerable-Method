require "./lib/enumerable_method"

describe Enumerable do
    describe "#my_each" do
      it "should return each element in an array" do
          expect(([2, 4, 6]).my_each { |num| puts num}).to eq([2, 4, 6])
      end
    end
end