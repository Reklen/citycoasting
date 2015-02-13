class UserRegistrationsController < Devise::RegistrationsController

	def create
		@user = resource
		UserMailer.new_user_geet(@user).deliver
	end


end