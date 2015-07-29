class ProfilesController < ApplicationController

  def stamps
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
      
      @search = Stamp.where(city_id: @city.id).search(params[:q])

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

  def follow
    @user = User.find(params[:id])
    if user_signed_in?
      current_user.follow(@user)
    end
    respond_to do |format|
      #format.html { redirect_to(:back)}
      format.js
      format.json { render json: @user.to_json} 
    end
  end

  def stop_follow
    @user = User.find(params[:id])
    if user_signed_in?
      current_user.stop_following(@user)
    end
    respond_to do |format|
      #format.html { redirect_to(:back)}
      format.js
      format.json { render json: @user.to_json} 
    end
  end


end
