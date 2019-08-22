# require 'minitest/autorun'
# require_relative 'transaction'

# class TransactionTest < MiniTest::Test
#   def setup
#     @transaction = Transaction.new(30)
#   end

#   def test_prompt_for_payment
#     input = StringIO.new('30\n')
#     @transaction.prompt_for_payment(input: input)
#     assert_equal(30, @transaction.amount_paid)
#   end
# end

require 'minitest/autorun'
require_relative 'transaction'

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(30)
    output = StringIO.new
    transaction.prompt_for_payment(input: StringIO.new('30\n'), output: output)
    assert_equal 30, transaction.amount_paid
  end
end