# Write a test that will fail if list and the return value of list.process are different objects.

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class ReturnTest < MiniTest::Test
  def setup
    @list = [1, 2, 3]
  end

  def test_return
    assert_same(@list, @list.process)
  end
end