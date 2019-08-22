class Element
  attr_reader :datum, :next

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_accessor :head

  def size
    number = 0
    element = @head
    while element
      number += 1
      element = element.next
    end
    number
  end

  def empty?
    @head.nil?
  end

  def push(datum) # create a new element with the datum passed in, set its next element to current head and then reassign                  /repoint the current head to the new element
    element = Element.new(datum, @head) 
    @head = element
  end

  def peek # access the top element
    @head.datum if @head
  end

  def pop
    datum = peek
    new_head = @head.next
    @head = new_head
    datum
  end

  def self.from_a(arr)
    arr = [] if arr.nil?
    dupe_arr = arr.dup
    list = SimpleLinkedList.new
    list.push(dupe_arr.pop) while (!dupe_arr.empty?)
    list
  end

  def to_a
    array = []
    array.push(pop) while !empty?
    array
  end

  def reverse
    list = SimpleLinkedList.new
    list.push(self.pop) while !empty?
    list
  end
end

l = SimpleLinkedList.new
p l.size
p l.peek
