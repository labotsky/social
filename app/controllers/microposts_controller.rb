class MicropostsController < ApplicationController
  def like
  	@current_user = current_user
  	@micropost = Micropost.find(params[:id])
  	if @current_user.flagged?(@micropost,:like)
  		@current_user.unflag(@micropost,:like)
  	else
  		@current_user.flag(@micropost,:like)
  	end
  	respond_to do |format|
  		format.js
  	end
  end
end
