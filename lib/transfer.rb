require "pry"
class Transfer
  attr_accessor :status 
  attr_reader :sender, :receiver, :amount 
  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @@all << self   
  end
  #binding.pry 

  def valid?
    @sender.valid? && @receiver.valid?
    #binding.pry 
  end 
  def execute_transaction
    if @sender.balance >= @amount && self.valid? && @status == "pending"
      @sender.balance -= @amount 
      @receiver.balance += @amount 
      return @status = "complete" 
    end

      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
    def reverse_transfer
      if @status == "complete" 
        @sender.balance += @amount
        @receiver.balance -= @amount
        @status = "reversed"
      end 
    end


end

