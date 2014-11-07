class ProfilesController < ApplicationController
 
  def show
  	
		@user = User.find_by_username(params[:id])
  	
		if @user
			#@stamps = @user.stamps.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
      #@stamps = Stamp.find_with_reputation(:votes,:all,order: 'votes desc')
      @stamps = Stamp.evaluated_by(:votes, @user)
      respond_to do |format|
        format.html
        format.js
      end
			
		else
  		render file: 'public/404', status: 404, formats: [:html]
  	end

  end
end
