require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class DownCaseTest < MiniTest::Test
  def setup
    @string = "XYZ"
  end

  def test_downcase
    assert_equal('xyz', @string.downcase)
  end
end