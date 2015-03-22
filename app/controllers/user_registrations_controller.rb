class UserRegistrationsController < Devise::RegistrationsController

	def create
		super do
			#UserMailer.new_user_geet(resource).deliver
		end
	end

	protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end