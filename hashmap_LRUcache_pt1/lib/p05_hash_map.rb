require_relative 'p04_linked_list'

class HashMap

  include Enumerable
  
  attr_accessor :count
  attr_reader :buckets

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
    @buckets = num_buckets
  end

  def include?(key)
  end

  def set(key, val)
    bucket(key).append(key, val)
  end

  def get(key)
    bucket(key)
  end

  def delete(key)
  end

  def each
  end

  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
  end

  def bucket(key)
    hash = key.hash
    @store[hash % buckets]
  end
  
end
