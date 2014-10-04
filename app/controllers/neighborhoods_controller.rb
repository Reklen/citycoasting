class NeighborhoodsController < ApplicationController
  before_action :set_neighborhood, only: [:show, :edit, :update, :destroy]

  def index
    
  end



  def new
    @neighborhood = Neighborhood.new(neighborhood_params)
    @neighborhoods = Neighborhood.all

  end

  def create
  
    @neighborhood = Neighborhood.new(neighborhood_params)

    if @neighborhood.save
      flash[:notice] = "New Neighborhood successfully created"
      redirect_to new_neighborhood_path
    else
      render :new
      # flash[:notice] = "Error"
    end
  end

  private
  def set_neighborhood
      @neighborhood = Neighborhood.find(params[:id])
  end
  
  def neighborhood_params
      params.require(:neighborhood).permit(:name) if params[:neighborhood]
  end
end
