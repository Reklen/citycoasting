class StampsController < ApplicationController
  before_action :set_stamp, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    if params[:category_id]
      @stamps = Stamp.where(category_id: params[:category_id])
      @stamps = @stamps.where("rank is not null").all.order("rank ASC").paginate(:page => params[:page], :per_page => 10)
    else
      @stamps = Stamp.where("rank is not null").order("rank ASC").all.paginate(:page => params[:page], :per_page => 10)
    end

    respond_to do |format|
        format.html { render :layout => false, flash: { myModal: true } } 
        format.js
    end
  end

  def show

    #Allowing all users to access stamp pgs
    # if user_signed_in? 
    # else
    #   redirect_to new_user_registration_path, notice: "Please sign up to view a stamp."
    # end
   
    gon.latcoord = @stamp.adr_coord_lat
    gon.lngcoord = @stamp.adr_coord_lng

    @stamp = Stamp.find(params[:id])
    @comment = @stamp.comments.new(user_id: current_user)
    @comments = @stamp.comments.recent.limit(10).all


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

  def vote
    if user_signed_in? 
      value = params[:type] == "up" ? 1 : 0
      @stamp = Stamp.find(params[:id])
      @stamp.add_or_update_evaluation(:votes, value, current_user)
      respond_to do |format|
        #format.html { redirect_to(:back)}
        format.js
        format.json { render json: @stamp.to_json} 
      end

    else
      redirect_to new_user_registration_path, notice: "Please sign up to add a stamp."
    end
  end

  def explore
     if params[:category_id]
      @category = Category.where(id: params[:category_id]) #not needed right now
      @stamps = Stamp.where(category_id: params[:category_id])
      @stamps = @stamps.where("rank is not null").all.order("rank ASC").paginate(:page => params[:page], :per_page => 10)
    else
      @stamps = Stamp.where("rank is not null").order("rank ASC").all.paginate(:page => params[:page], :per_page => 10)
    end

    respond_to do |format|
        format.html 
        format.js
    end
  end


  def modal_signup
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stamp
      @stamp = Stamp.find(params[:id])
    end

    def correct_user
      
      if current_user.role !='admin'
        @stamp = current_user.stamps.find_by(id: params[:id])
        redirect_to stamps_path, notice: "Not authorized to edit this stamp." if @stamp.nil?
      end
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def stamp_params
      params.require(:stamp).permit(:description, :image, :category_id, :city_id, :price_range, :neighborhood_id, :name, :adr_street_number, :adr_route, :adr_city, :adr_postal_code, :adr_state, :adr_country, :phone_number, :id, :adr_lat, :adr_lng, :website, :adr_coord_lat, :adr_coord_lng, :google_place_id, :formatted_address)
    end
end
