# Write a minitest assertion that will fail if the class of value is not Numeric or one of Numeric's subclasses (e.g., Integer, Float, etc).

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class NumericTest < MiniTest::Test
  def setup
    @value = 1
  end

  def test_numeric
    assert_kind_of(Numeric, @value)
  end
end