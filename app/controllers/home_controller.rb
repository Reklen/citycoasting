class HomeController < ApplicationController
  def index
    @stamps = Stamp.where("rank is not null").order("rank ASC").all.paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html { render :layout => false, flash: { myModal: true } } 
      format.js
    end
  end
end