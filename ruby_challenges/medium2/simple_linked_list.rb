class Element
  attr_reader :datum

  def initialize(value, next_val = nil)
    @datum = value
    @next_val = next_val
  end

  def tail?
    self.next.nil?
  end

  def next
    @next_val
  end
end

class SimpleLinkedList
  attr_accessor :array

  def initialize
    @array = []
  end

  def self.from_a(arr)
    return [] if arr == nil
    obj = new
    arr.reverse.each do |val|
      obj.push(val)
    end
    obj
  end

  def size
    self.array.size
  end

  def empty?
    self.array.empty?
  end

  def push(num)
    self.array.push(Element.new(num, self.array[-1]))
  end

  def pop
    self.array.pop.datum
  end

  def peek
    empty? ? nil : self.array[-1].datum
  end

  def head
    empty? ? nil : self.array[-1]
  end
end
