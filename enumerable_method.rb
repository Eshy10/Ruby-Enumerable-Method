module Enumerable
  def my_each
    return enum_for(:my_each) unless block_given?
    i = 0
    loop do
      break unless i < length

      yield self[i] 
      i += 1
    end
    self
  end

  def my_each_with_index
    return enum_for(:my_each_with_index) unless block_given?
    i = 0
    loop do
      break unless i < length

      yield self[i], i 
      i += 1
    end
    self
  end

  def my_select
    return enum_for(:select) unless block_given?
    i = 0
    new_arr = []
    loop do
      break unless i < length

      new_arr << self[i] if yield self[i]
      i += 1
    end
    new_arr
  end

  def my_all?(arg = nil)
    result = true
  my_each do |ele|
      case arg
    when nil
      result = false unless ele
    when Regexp
      result = false unless ele.to_s.match(arg)
    when Class
      result = false unless ele.is_a?(arg)
    when String 
      result = false unless ele == arg
    when Numeric
      result = false unless ele == arg 
    end
    result = yield(ele) if block_given?
  end
  result
end


def my_any?(arg = nil)
  result = false
my_each do |ele|
    case arg
  when nil
    result = true unless ele
  when Regexp
    result = true unless ele.to_s.match(arg)
  when Class
    result = true unless ele.is_a?(arg)
  when String 
    result = true unless ele == arg
  when Numeric
    result = true unless ele == arg 
  end
  result = yield(ele) if block_given?
end
result
end

def my_none?(arg = nil)
  result = false
my_each do |ele|
    case arg
  when nil
    result = true if ele
  when Regexp
    result = true if ele.to_s.match(arg)
  when Class
    result = true if ele.is_a?(arg)
  when String 
    result = true if ele == arg
  when Numeric
    result = true if ele == arg 
  end
  result = yield(ele) if block_given?
end
result
end

def my_count(arg = nil)
  count = 0
  my_each do |num|
  yield num if block_given?
  if arg == num
     count += 1   
 end
  end
  count
end

  def my_map
    return enum_for(:my_map) unless block_given?
    arr = []
    my_each do |num|
      arr << yield(num)
    end
    arr
  end

  def my_inject(total = self[0])
    drop(1).my_each do |num|
      total = yield(total, num)
    end
    total
  end
end

def multiply_els(arr)
  arr.my_inject { |x, y| x * y }
end

p multiply_els([2, 4, 5])
