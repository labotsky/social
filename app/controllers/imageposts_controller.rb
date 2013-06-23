class ImagepostsController < ApplicationController
	def create		
	    @imagepost = Imagepost.new(params[:imagepost])	   
	    @imagepost.save
	    render :nothing => true      
  	end
end
