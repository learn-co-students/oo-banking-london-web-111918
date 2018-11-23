

class BankAccount
  attr_accessor  :balance, :status
  attr_reader :name

  def initialize(name, balance = 1000, status = "open")
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(cash)
    @cash = cash
    @balance += @cash
  end

  def display_balance
    return "Your balance is $#{@balance}."
  end

  def valid?
    if (self.status == "open") && (self.balance > 0)
      return true
    end
    return false
  end

  def close_account
    self.status = "closed"
  end

end
