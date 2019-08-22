# Write a minitest assertion that will fail if the Array list is not empty.

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class EmptyTest < MiniTest::Test
  def setup
    @array = []
  end

  def test_empty
    assert_empty(@array)
  end
end