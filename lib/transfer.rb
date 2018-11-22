require_relative './bank_account.rb'
require "pry"

class Transfer

  attr_accessor :status, :amount
  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid? ? (return true) : false
  end

  def execute_transaction
    if self.sender.balance < self.amount
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif self.status != "complete"
      self.sender.withdraw(self.amount)
      self.receiver.deposit(self.amount)
      self.status = "complete"
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.deposit(self.amount)
      self.receiver.withdraw(self.amount)
      self.status = "reversed"
    end
  end

end

avi = BankAccount.new("Avi")
amanda = BankAccount.new("Amanda")
transfer = Transfer.new(amanda, avi, 50)

# Pry.start
