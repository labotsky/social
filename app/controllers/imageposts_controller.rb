class ImagepostsController < ApplicationController
	def create		
	    @imagepost = Imagepost.new(params[:imagepost])	   
	    @imagepost.save
	    respond_to do |format|
    		format.js
    	end     
  	end

  	def destroy
  		@imagepost = Imagepost.find(params[:id])
    	@imagepost.destroy
    	respond_to do |format|
      		format.js
    	end
  	end
end
