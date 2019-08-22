# Write a test that will fail if 'xyz' is one of the elements in the Array list:

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class IncludedTest < MiniTest::Test
  def setup
    @value = 'xyz'
    @array = ['abc', 'xz']
  end

  def test_inclusion
    refute_includes(@array, @value)
  end
end