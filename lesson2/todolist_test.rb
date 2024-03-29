require 'minitest/autorun'
require 'minitest/reporters'
require 'simplecov'
SimpleCov.start
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Todays Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done_question
    assert_equal(false, @list.done?)
  end

  def test_add_raise_error
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add("Hi") }
  end

  def test_shovel
    @todo4 = Todo.new("Mow lawn")
    @list << @todo4
    @todos << @todo4

    assert_equal(@todos, @list.to_a)
  end

  def test_add_alias
    @todo5 = Todo.new("Feed peyton")
    @list.add(@todo5)
    @todos << @todo5

    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(10) }
    index = 0
    @todos.each do |todo|
      assert_equal(todo, @list.item_at(index))
      index += 1
    end
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(10) }
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(10) }
    @todo1.done!
    @todo2.done!
    @todo3.done!

    @list.mark_undone_at(1)

    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_done_bang
    @list.done!
    index = 0
    @todos.each do |todo|
      assert_equal(todo, @list.to_a[index])
      index += 1
    end
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }
    assert_equal(@todos[1], @list.remove_at(1))

    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
  ---- Todays Todos ----
  [ ] Buy milk
  [ ] Clean room
  [ ] Go to gym
  OUTPUT

  assert_equal(output, @list.to_s)
  end
  
  def test_to_s_again
    output = <<~OUTPUT.chomp
  ---- Todays Todos ----
  [ ] Buy milk
  [X] Clean room
  [ ] Go to gym
  OUTPUT
  
  @list.mark_done_at(1)
  assert_equal(output, @list.to_s)
  end

  def test_to_s_all_done
        output = <<~OUTPUT.chomp
  ---- Todays Todos ----
  [X] Buy milk
  [X] Clean room
  [X] Go to gym
  OUTPUT

  @list.done!
  assert_equal(output, @list.to_s)
  end

  def test_each
    index = 0
    @todos.each do |todo|
      assert_equal(todo, @list.to_a[index])
      index += 1
    end
  end

  def test_each_return_value
    return_val = @list.each { }
    assert_equal(@list, return_val)
  end

  def test_select
    return_value = @list.select { |todo| todo == @todo1 }
    new_list = TodoList.new('Testing select')
    new_list.add(@todo1)
    assert_equal(new_list.to_a, return_value.to_a)
  end
end
