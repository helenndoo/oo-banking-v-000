class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  # your code here
def initialize(sender, reciever, amount)
  @sender = sender
  @receiver = reciever
  @amount = amount
  @status = "pending"
end

def valid?
  sender.valid? && receiver.valid?
end

def execute_transaction
  if valid? && status == "pending" && sender.balance >= amount
        sender.balance -= amount
        receiver.balance = amount
        @status = "complete"
        return_status = status
      else
        @status = "rejected"
        return_status = "Transaction rejected. Please check your account balance."
      end
      return_status
    end

    def reverse_transfer
      if valid? && status == "complete" && receiver.balance >= amount
        receiver.balance -= amount
        sender.balance = amount
        @status = "reversed"
      end
    end

   end
