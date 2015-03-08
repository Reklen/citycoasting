class UserRegistrationsController < Devise::RegistrationsController

	def create
		super do
			UserMailer.new_user_geet(resource).deliver
		end
	end
	
	protected

  def update_resource(resource, params)
    if current_user.provider == "facebook"
      params.delete("current_password")
      resource.update_without_password(params)
    else
      resource.update_with_password(params)
    end
  end


end