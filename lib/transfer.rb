class Transfer
  # your code here

  attr_accessor :sender, :receiver, :amount, :status, :bank_account

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"

  end

  def valid?
    if @sender.valid? == true && @receiver.valid? == true && @sender.balance > amount
      true
    else
      false
    end
  end

  def execute_transaction
    if @sender.balance > amount && @status == "pending"
      @sender.balance -= amount
      @receiver.balance += amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
   end
  end

  def reverse_transfer
    if self.status == "complete"
      @sender.balance += amount
      @receiver.balance -= amount
      @status = "reversed"
    end
  end

end
