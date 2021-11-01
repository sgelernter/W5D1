class HashSet

  attr_reader :count
  attr_accessor :buckets

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @buckets = num_buckets
  end

  def insert(key)
    hash = key.hash
    unless self.include?(key)
      self[hash] << key
      @count += 1
    end 
    resize! if count > buckets
  end

  def include?(key)
    hash = key.hash
    self[hash].include?(key)
  end

  def remove(key)
    hash = key.hash
    if self.include?(key)
      self[hash].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    @store[num % buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    flat_duped = @store.dup.flatten
    new_buckets = Array.new(buckets) {Array.new}
    @store.concat(new_buckets)
    until flat_duped.empty?
      next_ele = flat_duped.shift
      hash = next_ele.hash
      self.remove(next_ele)
      @store[hash % (buckets * 2)] << next_ele
      @count += 1
    end
    @buckets *= 2
  end
end
