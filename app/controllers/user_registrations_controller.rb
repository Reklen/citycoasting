class UserRegistrationsController < Devise::RegistrationsController

	def create
		super
		UserMailer.new_user_geet(@resource).deliver
		
	end


end