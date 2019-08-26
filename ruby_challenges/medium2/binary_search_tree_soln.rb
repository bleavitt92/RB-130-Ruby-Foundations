class Bst
  attr_accessor :data, :left, :right

  def initialize(number=nil)
    @data = number
  end

  def insert(number)
    if number <= data 
      @left ? @left.insert(number) : @left = Bst.new(number)
    else
      @right ? @right.insert(number) : @right = Bst.new(number)
    end
  end

  def each(&block)
    return to_enum(:each) unless block_given?
    
    @left.each(&block) if @left
    block.call(@data)
    @right.each(&block) if @right
  end
end

p Bst.new(4).data