class BillsController < ApplicationController
  respond_to :html, :json

	def new
		@bill = Bill.new
	end

	def create
		@bill = Bill.new(params[:bill])
		@bill.save
		redirect_to @bill
	end

	def show
	  @bill = Bill.find(params[:id])
	end

	def index
		sort=params[:sort]
		if sort == "amount" 
			@bills= Bill.find(:all,:order =>"amount DESC")
		elsif sort=="issue_date"
			@bills=Bill.find(:all,:order => "issue_date")
		elsif sort=="status"
			@bills=Bill.find(:all,:order => "status DESC,issue_date")
		else
     	@bills = Bill.all
     end
	end

	def edit
		@bill = Bill.find(params[:id])
	end

	def update
    	@bill = Bill.find(params[:id])
    	@bill.update_attributes(params[:bill])
    	respond_with @bill
  	end
    def destroy
  		@bill = Bill.find(params[:id])
  		@bill.destroy
 
  		respond_to do |format|
    		format.html { redirect_to bills_url }
    		format.json { head :no_content }
  		end
	end

	def outstanding
		@bills = Bill.find(:all, :conditions =>{:status => "Pending"})
	end	


		
end

