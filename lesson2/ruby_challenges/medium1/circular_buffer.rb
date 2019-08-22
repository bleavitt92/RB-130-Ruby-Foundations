# create a buffer CircularBuffer.new(how big it should be or max size)
# methods: 
# => write instance method (value) -- adds the value to array
# => read instance method -- shift takes off the first value in an array
# => write! - overwrites the first value in the array - do this by shift then adding

# exceptions:
# => CircularBuffer::BufferEmptyException -- when call read on an empty buffer
# => CircularBuffer::BufferFullException -- when call write on an array that == max size

class CircularBuffer
  attr_reader :max_size
  attr_accessor :buffer

  def initialize(max_size)
    @max_size = max_size
    clear
  end

  def write(value)
    raise BufferFullException if buffer.size == max_size
    buffer << value unless value == nil
  end

  def read
    raise BufferEmptyException if buffer.empty?
    buffer.shift
  end

  def write!(value)
    unless value == nil
      buffer.shift if buffer.size == max_size
      write(value)
    end
  end

  def clear
    @buffer = []
  end

  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end
end
