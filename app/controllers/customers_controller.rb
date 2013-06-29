class CustomersController < ApplicationController
	respond_to :html, :json

	def new
		@customer = Customer.new
	end

	def create
		@customer = Customer.new(params[:customer])
		@customer.save
		redirect_to @customer
	end

	def show
	  @customer = Customer.find(params[:id])
	end

	def index
		if params[:search].present?
		   @customers = Customer.search(params[:search])
    	else
      		@customers = Customer.all
    	end

		respond_to do |f|
			f.html
			f.csv { send_data Customer.to_csv }
			f.xls 
		end
		
	end

	def edit
		@customer = Customer.find(params[:id])
	end

	def update
    	@customer = Customer.find(params[:id])
    	@customer.update_attributes(params[:customer])
    	respond_with @customer
  	end
    def destroy
  		@customer = Customer.find(params[:id])
  		@customer.destroy
 
  		respond_to do |format|
    	format.html { redirect_to customers_url }
    	format.json { head :no_content }
  	end
end


end
