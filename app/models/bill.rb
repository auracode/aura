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

 def self.outstanding_amount
    a = Payment.all.map { |m| m.customer_id }.uniq
    b = Customer.find(a).map { |n| n.bill_ids}
    c = Bill.find(b)
    d = c.map {|o| o.amount if o.status=="Pending"}.compact
    @amount = d.inject(0) { |sum, x| sum +x }
 end

end
