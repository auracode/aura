class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
   # attr_accessible :title, :body
  after_create :generate_api_token

 

 private 

def generate_api_token
	self.api_token = Devise.friendly_token
	self.save
end


 


end
