require 'simplecov'
require 'minitest/autorun'
require "minitest/reporters"
SimpleCov.start
Minitest::Reporters.use!

require_relative 'todo_list'

class TodoListTest < Minitest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
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

  def test_done?
    assert_equal(false, @list.done?)
    @list.done!
    assert_equal(true, @list.done?)
  end

  def test_todo_type
    assert_raises(TypeError) do
      @list.add("object")
    end
  end

  def test_shovel
    @list << @todo1
    assert_equal([@todo1, @todo2, @todo3, @todo1], @list.to_a)
  end

  def test_add
    @list.add(@todo1)
    assert_equal([@todo1, @todo2, @todo3, @todo1], @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(@list.size) }
    assert_equal(@todo1, @list.item_at(0))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(@list.size) }
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(@list.size) }
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
    @list.mark_undone_at(0)
    assert_equal(false, @todo1.done?)
  end

  def test_done
    @list.done!
    assert_equal(true, @list.done?)
  end

  def test_find_by_title
    title = @todo1.title
    result = @list.select { |item| item.title == title }
    assert_equal(result.first, @list.find_by_title(title))
  end

  def test_remove_at
    @list.remove_at(0)
    assert_equal([@todo2, @todo3], @list.to_a)
    assert_raises(IndexError) { @list.remove_at(@list.size) }
  end

  def test_all_done
    list = TodoList.new(@list.title)
    list.add(@todo1)
    @todo1.done!
    assert_equal(list.to_s, @list.all_done.to_s)
  end

  def test_all_not_done
    list = TodoList.new(@list.title)
    list.add(@todo1)
    @todo2.done!
    @todo3.done!
    assert_equal(list.to_s, @list.all_not_done.to_s)
  end

  def test_mark_done
    title = @todo1.title
    @list.mark_done(title)
    assert_equal(true, @todo1.done?)
  end

  def test_mark_all_done
    @list.mark_all_done
    assert_equal(true, @list.done?)
  end

  def test_mark_all_undone
    @list.mark_all_done
    assert_equal(true, @list.done?)
    @list.mark_all_undone
    assert_equal(false, @list.done?)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_item_done
    @list.mark_done_at(0)

    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_done
    @list.done!
    
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_each
    result = []
    @list.each { |item| result << item }
    compare = [@todo1, @todo2, @todo3]
    assert_equal(compare, result)
  end

  def test_each_return
    result = @list.each {|item| "_" }
    assert_equal(@list, result)
  end

  def test_select
    result = TodoList.new(@list.title)
    result << @todo1
    compare = @list.select { |item| item == @todo1 }
    assert_equal(result.to_s, compare.to_s)
  end

end