class Api::CustomersController < ApplicationController

	def index
	@customers = Customer.all
	respond_to do |format|
		format.json {render :json => @customers.to_json}
	end
	end

end