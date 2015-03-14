class HomeController < ApplicationController
  def index
    
      @stamps = Stamp.first(2)
   
    
    respond_to do |format|
      format.html { render :layout => false, flash: { myModal: true } } 
      format.js
    end
  end
end