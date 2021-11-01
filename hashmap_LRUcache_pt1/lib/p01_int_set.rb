require "byebug"

class MaxIntSet

  attr_accessor :store

  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" if num < 0 || num > @max
    store[num] = true
  end

  def remove(num)
    store[num] = false
  end

  def include?(num)
    store[num] ? true : false
  end

  # private

  # def is_valid?(num)
  # end

  # def validate!(num)
  # end
end


class IntSet

  attr_reader :mod

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @mod = num_buckets
  end

  def insert(num)
    self[num] << num 
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % mod]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet

  attr_reader :count
  attr_accessor :mod

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @mod = num_buckets
  end

  def insert(num)
    unless self.include?(num)
      self[num] << num 
      @count += 1
    end
    resize! if count > mod
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % mod]
  end

  def num_buckets
    @store.length
  end

  def resize! 
    new_buckets = Array.new(mod) { Array.new }
    duped = @store.dup.flatten
    @store.concat(new_buckets)
    until duped.empty?
      next_ele = duped.shift
      self.remove(next_ele)
      @store[next_ele % (mod * 2)] << next_ele
      @count += 1
    end
    @mod *= 2
  end

end
