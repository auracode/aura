class CustomersController < ApplicationController
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
		@customers = Customer.all

		respond_to do |f|
			f.html
			f.csv { send_data Customer.to_csv }
			f.xls 
		end
		
	end

end
