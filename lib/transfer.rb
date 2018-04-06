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
     if valid? && @status == 'pending'
        sender.withdrawl(amount)
        receiver.deposit(amount)
        # @last_transfer = @amount
        @status = 'complete'

     else
         @status = 'rejected'
        "Transaction rejected. Please check your account balance."
     end
   end

   def reverse_transfer
      if @status == 'complete'
        sender.deposit(amount)
        receiver.withdrawl(amount)
        @status = 'reversed'
      end
  end

end
