require "test_helper"

class TransactionTest < ActiveSupport::TestCase
  setup do
    @transaction = build(:transaction)
  end

  test "saves successfully with valid attributes" do
    assert @transaction.save!
  end

  test "is invalid without description" do
    @transaction.description = nil
    assert @transaction.invalid?
    assert @transaction.errors[:description].one?
  end

  test "is invalid without amount" do
    @transaction.amount = nil
    assert @transaction.invalid?
    assert @transaction.errors[:amount].one?
  end

  test "is invalid with not numerical amount" do
    @transaction.amount = "1$"
    assert @transaction.invalid?
    assert @transaction.errors[:amount].one?
  end

  test "is invalid without budget" do
    @transaction.budget = nil
    assert @transaction.invalid?
    assert @transaction.errors[:budget].one?
  end

  test "is invalid without participants" do
    @transaction.participants = []
    assert @transaction.invalid?
    assert @transaction.errors[:participants].one?
  end
end