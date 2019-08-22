# figure out how to account for this situation: 
# => four = start with 4
# => insert 2
# => insert 3
# => four.left.data = 2, not 3

require 'pry'
class Bst
  attr_accessor :num, :current_num

  def initialize(num)
    @num = num
    @current_num = num
    @tree = []
    @tree << num
  end
  
  def data
    @moving_tree = @tree
    current_num
  end

  def insert(n)
    n > num ? @tree.push(n) : @tree.prepend(n)
    @moving_tree = @tree
  end

  def left
    index = @moving_tree.find_index(current_num)
    loop do 
      if @moving_tree[index-1] < current_num
        self.current_num = @moving_tree[index-1]
        @moving_tree = @moving_tree[0..index-1]
        @moving_tree = self.update_tree_from_left
        return self
      else 
        index -= 1
        @moving_tree = self.update_tree_from_left
        return self if index == 0
      end
    end
  end

  def right
    index = @moving_tree.find_index(current_num)
    loop do
      if @moving_tree[index+1] > current_num
        self.current_num = @moving_tree[index+1]
        @moving_tree = @moving_tree[index+1..-1]
        @moving_tree = self.update_tree_from_right
        return self
      else
        index += 1
        @moving_tree = self.update_tree_from_right
        return self if index == @moving_tree.size
      end 
    end
  end

  def update_tree_from_left
    @moving_tree.each do |num|
      if num > current_num
        @moving_tree.delete(num)
        @moving_tree.push(num)
      end
    end
    @moving_tree
  end

  def update_tree_from_right
    @moving_tree.each do |num|
      if num < current_num
        @moving_tree.delete(num)
        @moving_tree.prepend(num)
      end
    end
    @moving_tree
  end
end

