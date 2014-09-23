class CitiesController < ApplicationController
  def index
  	
  end

  def show
  	@city = City.find(params[:id])
  	if params[:category_id]
  		@stamps = Stamp.all.where(city_id: @city.id, category_id: params[:category_id]).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  	else
      @stamps = Stamp.all.where(city_id: @city.id).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    end

  end
end
