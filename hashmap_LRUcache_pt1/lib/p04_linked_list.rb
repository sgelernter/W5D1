require "byebug"

class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @prev.next, @next.prev = self.next, self.prev
    self.next, self.prev = nil, nil
  end
end

class LinkedList

  include Enumerable 

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next, @tail.prev = @tail, @head 
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    self.empty? ? @head : @head.next
  end

  def last
    self.empty? ? @tail : @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
    node = Node.new(key, val)
    previous = self.empty? ? @head : self.last
    node.prev, node.next = previous, @tail
    previous.next, @tail.prev = node, node
  end

  def update(key, val)
  end

  def remove(key)
  end

  # def each
  #   current_node = @head.next
  #   until current_node = @tail
  #     yield current_node
  #     current_node = current_node.next
  #   end
  # end


  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
