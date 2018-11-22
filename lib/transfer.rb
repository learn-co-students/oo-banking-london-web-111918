class Transfer
  # your code here
  attr_accessor :bank_account, :sender, :receiver, :amount, :status, :transfers

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    !self.sender.valid? || !self.receiver.valid? ? false : true
  end

  def execute_transaction
    if self.valid? == true && self.status == 'pending' && self.amount < self.sender.balance
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.sender.valid? == true && self.receiver.valid? == true && self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end

end
