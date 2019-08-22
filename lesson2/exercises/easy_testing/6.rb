# Write a minitest assertion that will fail unless employee.hire raises a NoExperienceError exception.

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class RaiseExceptionTest < MiniTest::Test
  def setup
    
  end

  def test_exept
    assert_raises(NoExperienceError) { employee.hire }
  end
end