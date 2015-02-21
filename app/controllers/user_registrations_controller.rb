class UserRegistrationsController < Devise::RegistrationsController

	def create
		super
		user = resource
		UserMailer.new_user_geet(user).deliver
		
	end


end