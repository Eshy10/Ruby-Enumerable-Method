# rubocop:disable Metrics/MethodLength,Metrics/ModuleLength,Style/IfInsideElse,Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity
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
      return false if !result
    end
    result
  end

  def my_any?(arg = nil)
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
      return true if result
    end
    result
  end

  def my_none?(arg = nil)
    result = true
    my_each do |ele|
      case arg
      when nil
        result = false if ele
      when Regexp
        result = false if ele.to_s.match(arg)
      when Class
        result = false if ele.is_a?(arg)
      when String
        result = false if ele == arg
      when Numeric
        result = false if ele == arg
      end
      result = !yield(ele) if block_given?
      return false if !result
    end
    result
  end

  def my_count(arg = nil)
    count = 0
    my_each do |num|
      if block_given?
        count += 1 if yield(num) == true
      elsif arg == num
        count += 1
      else
        count += 1 if arg.nil?
      end
    end
    count
  end

  def my_map(proc = nil)
    arr = []
    my_each do |num|
      if proc.nil?
        return to_enum(:my_map) unless block_given?

        arr << yield(num)
      else
        arr << proc.call(num)
      end
    end
    arr
  end

  def my_inject(total = nil, arg = nil)
    arg = total if arg.nil?
    case total
    when nil
      arr = drop(1).to_a
      total = to_a[0]
    when Symbol
      if total.is_a?(Symbol)
        arr = drop(1).to_a
        total = to_a[0]
      end
    else
      arr = to_a
    end
    arr.my_each do |num|
      total = if block_given?
                yield(total, num)
              else
                total.send(arg, num)
              end
    end
    total
  end
end

def multiply_els(arr)
  arr.my_inject { |x, y| x * y }
end

p multiply_els([2, 4, 5])
# rubocop:enable Metrics/MethodLength,Metrics/ModuleLength,Style/IfInsideElse,Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity
