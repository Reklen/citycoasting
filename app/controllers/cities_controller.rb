class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]

  def index
  	
  end

  def show
  	@city = City.friendly.find(params[:id])

    #@city_img = city_header_img(@city.id)
    
  	gon.city_instance_id = @city.id
  	
  	if params[:category_id]
  		@stamps = Stamp.all.where(city_id: @city.id, category_id: params[:category_id]).order("created_at ASC").paginate(:page => params[:page], :per_page => 10)
  	else
      @stamps = Stamp.all.where(city_id: @city.id).order("created_at ASC").paginate(:page => params[:page], :per_page => 10)
    end

  end


  def new
    @city = City.new(city_params)
    @cities = City.all

  end

  def create
  
    @city = City.new(city_params)

    if @city.save
      flash[:notice] = "New city successfully created"
      redirect_to new_city_path
    else
      render :new
      # flash[:notice] = "Error"
    end
  end

  private
  def set_city
      @city = City.friendly.find(params[:id])
  end
  
  def city_params
      params.require(:city).permit(:name) if params[:city]
  end
end
