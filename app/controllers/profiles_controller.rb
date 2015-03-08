class ProfilesController < ApplicationController

  def stamps
		@user = User.find_by_username(params[:id])  	
		if @user
			#@stamps = @user.stamps.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
      #@stamps = Stamp.find_with_reputation(:votes,:all,order: 'votes desc')
      @posts = @user.stamps
      @stamps = Stamp.evaluated_by(:votes, @user)

      respond_to do |format|
        format.html
        format.js
      end
		else
  		render file: 'public/404', status: 404, formats: [:html]
  	end
  end

  def posts
    @user = User.find_by_username(params[:id])
    if @user
      #@stamps = @user.stamps.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
      #@stamps = Stamp.find_with_reputation(:votes,:all,order: 'votes desc')
      @posts = @user.stamps
      @stamps = Stamp.evaluated_by(:votes, @user)

      respond_to do |format|
        format.html
        format.js
      end
    else
      render file: 'public/404', status: 404, formats: [:html]
    end
  end

  def cities
    @user = User.find_by_username(params[:id])
    if @user
      #@stamps = @user.stamps.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
      #@stamps = Stamp.find_with_reputation(:votes,:all,order: 'votes desc')
      @posts = @user.stamps
      @stamps = Stamp.evaluated_by(:votes, @user)
      @cities = []
      @stamps.each do |stamp|
        unless @cities.include?(stamp)
          @cities << stamp.city
        end
      end
      @cities = @cities.uniq{|x| x.id}

      respond_to do |format|
        format.html
        format.js
      end
    else
      render file: 'public/404', status: 404, formats: [:html]
    end
  end
end
