class PaymentsController < ApplicationController
  def index
    sort=params[:sort]
    if sort == "amount" 
      @bills= Bill.find(:all,:order =>"amount DESC")
    elsif sort=="issue_date"
      @bills=Bill.find(:all,:order => "issue_date")
    elsif sort=="status"
      @bills=Bill.find(:all,:order => "status DESC,issue_date")
    else

    @customer = Customer.find(params[:customer_id])
    @payments = Payment.find(:all, :conditions =>{:customer_id => params[:customer_id]})
    @bill_ids = @payments.map { |e| e.bill_id }
    @bills = Bill.find(:all, :conditions =>{:id => @bill_ids})
  end
  end

  def edit
  end

  def show
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end
end
