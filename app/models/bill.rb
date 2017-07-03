class Bill < ActiveRecord::Base
  attr_accessible :amount, :bank_name, :bill_no, :bill_type, :cheque_no, :collected_by, :credited_on, :issue_date, :remaining_amount, :status, :customer_ids
  has_many :payments
  has_many :customers ,:through => :payments

 def payments?
 	if self.payments == nil
 		true
 	else 
 		false
 	end
 	
 end
end
