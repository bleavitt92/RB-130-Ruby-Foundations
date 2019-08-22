# Write a minitest assertion that will fail if the 'xyz' is not in the Array list.


require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class IncludedTest < MiniTest::Test
  def setup
    @list = 'xyz'
    @array = ['abc', 'xyz']
  end

  def test_included
    assert_includes(@array, @list)
  end
end