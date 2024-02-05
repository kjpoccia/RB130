require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTests < Minitest::Test
  def setup
    @register = CashRegister.new(0)
  end

  def test_accept_money
    transaction = Transaction.new(30)
    transaction.amount_paid = 30

    starting_value = @register.total_money
    @register.accept_money(transaction)
    assert_equal(starting_value + 30, @register.total_money)
  end

  def test_change
    transaction = Transaction.new(30)
    transaction.amount_paid = 30

    assert_equal(0, @register.change(transaction))
  end

  def test_give_receipt
    transaction = Transaction.new(30)
    assert_output("You've paid $30.\n") { @register.give_receipt(transaction) }
  end
end