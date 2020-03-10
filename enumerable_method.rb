module Enumerable
  def my_each
    i = 0
    loop do
      break unless i < length

      yield self[i] if block_given?
      i += 1
    end
    self
  end

  def my_each_with_index
    i = 0
    loop do
      break unless i < length

      yield self[i], i if block_given?
      i += 1
    end
    self
  end

  def my_select
    i = 0
    new_arr = []
    loop do
      break unless i < length

      new_arr << self[i] if yield self[i]
      i += 1
    end
    new_arr
  end

  def my_all?
    result = true
    my_each do |num|
      result = false unless yield num
    end
    result
  end

  def my_any?
    result = false
    my_each do |num|
      result = true if yield num
    end
    result
  end

  def my_none?
    result = true
    my_each do |num|
      result = false if yield num
    end
    result
  end

  def my_count
    count = 0
    my_each do |num|
      count += 1 if yield num
    end
    count
  end

  def my_map
    arr = []
    my_each do |num|
      arr << yield(num) if yield(num)
    end
    arr
  end

  def my_inject(&proc)
    sum = self[0]
    drop(1).my_each do |num|
      sum = proc.call(sum, num)
    end
    sum
  end
end

def multiply_els(arr)
  arr.my_inject { |x, y| x * y }
end

p multiply_els([2, 4, 5])
