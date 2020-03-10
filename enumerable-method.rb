module Enumerable
    def my_each
        i = 0
       loop  do
            if i < self.length
          yield self[i] if block_given?
          i += 1
      else
          break
        end
    end
    self
      end

      def my_each_with_index
        i = 0
       loop  do
            if i < self.length
          yield self[i], i if block_given?
          i += 1
      else
          break
        end
    end
    self
      end

      def my_select
        i = 0
        newArr = []
        loop do
             if i < self.length
         newArr << self[i] if yield self[i]
           i += 1
       else
           break
        end 
    end
    newArr
     end

     def my_all?
        result = true
         my_each do |num|
         unless yield num
          result = false
         end
       end
       result
      end

      def my_any?
        result = false
       my_each do |num|
        if yield num
        result = true 
    end
     end
     result
    end

    def my_none?
        result = true
       my_each do |num|
        if yield num
        result = false 
      end
      end
      result
      end

      def my_count
        count = 0
        my_each do |num|
            if yield num
            count += 1
        end
        end
        count
       end
end