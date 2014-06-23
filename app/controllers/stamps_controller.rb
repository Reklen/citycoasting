class StampsController < ApplicationController
  before_action :set_stamp, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @stamps = Stamp.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
        format.html
        format.js
    end
  end


  def show
   
    gon.latcoord = @stamp.adr_coord_lat
    gon.lngcoord = @stamp.adr_coord_lng
  end


  def new
    @stamp = current_user.stamps.build
  end

  # GET /stamps/1/edit
  def edit
  end


  def create
    @stamp = current_user.stamps.build(stamp_params)

    respond_to do |format|
      if @stamp.save
        format.html { redirect_to @stamp, notice: 'Stamp was successfully created.' }
        format.json { render :show, status: :created, location: @stamp }
      else
        format.html { render :new }
        format.json { render json: @stamp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stamps/1
  # PATCH/PUT /stamps/1.json
  def update
    respond_to do |format|
      if @stamp.update(stamp_params)
        format.html { redirect_to @stamp, notice: 'Stamp was successfully updated.' }
        format.json { render :show, status: :ok, location: @stamp }
      else
        format.html { render :edit }
        format.json { render json: @stamp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stamps/1
  # DELETE /stamps/1.json
  def destroy
    @stamp.destroy
    respond_to do |format|
      format.html { redirect_to stamps_url, notice: 'Stamp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stamp
      @stamp = Stamp.find(params[:id])
    end

    def correct_user
      @stamp = current_user.stamps.find_by(id: params[:id])

      redirect_to stamps_path, notice: "Not authorized to edit this stamp." if @stamp.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stamp_params
      params.require(:stamp).permit(:description, :image, :category, :price_range, :neighborhood, :name, :adr_street_number, :adr_route, :adr_city, :adr_postal_code, :adr_state, :adr_country, :phone_number, :id, :adr_lat, :adr_lng, :website, :adr_coord_lat, :adr_coord_lng, :google_place_id, :formatted_address)
    end
end
