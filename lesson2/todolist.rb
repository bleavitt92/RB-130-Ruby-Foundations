# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    if todo.class == Todo
      @todos << todo 
    else 
      raise TypeError, "Can only add Todo objects"
    end
  end
  alias_method :<<, :add

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def to_a
    @todos.clone
  end

  def done?
    @todos.select { |todo| todo.done? }.size == @todos.size
  end

  def item_at(index)
    raise IndexError if index >= @todos.size
    @todos[index]
  end

  def mark_done_at(index)
    raise IndexError if index >= @todos.size
    @todos[index].done!
  end

  def mark_undone_at(index)
    raise IndexError if index >= @todos.size
    @todos[index].undone!
  end

  def done!
    @todos.each { |todo| todo.done! }
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(index)
    raise IndexError if index >= @todos.size
    @todos.delete_at(index)
  end

  # def to_s
  #   puts "---- Today's Todos ----"
  #   @todos.each { |todo| puts todo }
  # end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def each
    @todos.each do |todo|
      yield(todo)
    end
    self
  end

  def select
    selected_todos = TodoList.new(title)
    each do |todo|
      selected_todos << todo if yield(todo) # passing todo into the block, if it's truthy, we add it to selected
    end
    selected_todos
  end

  def find_by_title(title)
    select { |todo| todo.title == title}.first
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(title_to_find)
     each do |todo|
       todo.done! if title_to_find == todo.title
    end
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end
end
