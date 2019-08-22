require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class OddTest < MiniTest::Test
  def setup
    @value = 7
  end
  
  def test_odd
    assert_equal(true, @value.odd?)
  end
end