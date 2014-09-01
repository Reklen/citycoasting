class ProfilesController < ApplicationController
 
  def show
  	
		@user = User.find_by_username(params[:id])

  	
		if @user
			@stamps = @user.stamps.all.order("created_at DESC").paginate(:page => params[:page], :per_page => @user.stamps.count)
     
			render action: :show
		else
  		render file: 'public/404', status: 404, formats: [:html]
  	end

  end
end
