class UserRegistrationsController < Devise::RegistrationsController

	def create
		super do
			UserMailer.new_user_geet(resource).deliver
		end
		
	end

end