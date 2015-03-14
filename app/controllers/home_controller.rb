class HomeController < ApplicationController
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
end