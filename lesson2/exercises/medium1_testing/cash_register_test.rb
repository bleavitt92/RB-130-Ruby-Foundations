require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'cash_register'
require_relative 'transaction'
Minitest::Reporters.use!

class CashRegisterTest < MiniTest::Test
  def setup
    @register = CashRegister.new(1000)
    @transaction = Transaction.new(30) 

    @transaction.amount_paid = 50
  end

  def test_accept_money
    previous_amount = @register.total_money
    @register.accept_money(@transaction)
    current_amount = @register.total_money

    assert_equal(previous_amount + 50, current_amount)
  end

  def test_change
    cost = @transaction.item_cost
    assert_equal(20, @transaction.amount_paid - cost)
  end

  def test_give_receipt
    assert_output("You've paid $#{@transaction.item_cost}.\n") { @register.give_receipt(@transaction) }
  end

  def test_prompt_for_payment
    assert(@transaction.prompt_for_payment)
  end
end