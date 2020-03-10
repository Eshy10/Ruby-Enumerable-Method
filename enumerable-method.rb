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
end