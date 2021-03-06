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
    		@customers = Customer.where(:hidden => false)
      		#@customers = Customer.all
    	end

		respond_to do |f|
			f.html
			f.csv { send_data Customer.to_csv }
			f.xls 
		end
		
	end

	def select
		if params[:tag_ids]
		@customers = Customer.find(params[:tag_ids])
		else
		@customers = Customer.all
		end
	end

	def unhide

		if params[:search].present?
		   @customers = Customer.search(params[:search])
    	else
    		#@customers = Customer.where(:hidden => false)
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

	def edit_delivery_date
		@customer = Customer.find(params[:id])
	end

	def update_delivery_date
		@customer = Customer.find(params[:id])
    	@customer.update_attributes(params[:customer])
    	respond_with @customer
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
	def import
		if params[:file].nil?
		   redirect_to customers_path, notice: "Select a file before Importing!"
		   	
		elsif params[:file].original_filename.split('.').last != 'csv'
		 	 redirect_to customers_path, notice: "Select a csv file only"
	    else
	      Customer.import(params[:file])
		  redirect_to customers_path, notice: "Clients Imported"	
	    end
	end
end
