class Transfer

attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if @sender.valid? == true && @receiver.valid? == true
      true
    else
      false
    end
  end

  def execute_transaction
    if @sender.balance > @amount && @status == "pending"
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
  else
    @status = "rejected"
    return "Transaction rejected. Please check your account balance."
  end
end

  def reverse_transfer
    if @receiver.balance > @amount && @status == "complete"
    @receiver.balance -= @amount
    @sender.balance += @amount
    @status = "reversed"
  else
    @status = "rejected"
    return "Transaction rejected. Please check your account balance."
  end
end

end
