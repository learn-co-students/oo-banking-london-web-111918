require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status, :amount_transferred

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @amount_transferred = 0
    @last_transaction = self
  end

  def valid?
    self.sender.status == "open" && self.receiver.status == "open"
    sender.valid? == true && receiver.valid? == true
  end

  def execute_transaction
    if self.sender.balance >= self.amount
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
      self.amount_transferred = self.amount
      self.amount = 0
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @last_transaction.status = "complete"
      @last_transaction.sender.balance += self.amount_transferred
      @last_transaction.receiver.balance -= self.amount_transferred
      self.status = "reversed"

    end
  end
end
