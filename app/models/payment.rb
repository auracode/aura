class Payment < ActiveRecord::Base
  attr_accessible :bill_id, :customer_id, :remark, :reminder
  belongs_to :customer
  belongs_to :bill
  accepts_nested_attributes_for :customer
  accepts_nested_attributes_for :bill
end
