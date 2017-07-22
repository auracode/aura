class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_with_token 
  before_filter :authenticate_user!


private 

	def authenticate_with_token
		if params[:api_token].nil?
			
		else
		user = User.find_by_api_token(params[:api_token]) 
		sign_in(user)

		end
		
		
	end
end
