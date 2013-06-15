class MicropostsController < ApplicationController

  def new
    @micropost = Micropost.new    
  end

  def create
    @micropost = Micropost.new(params[:micropost])
    @micropost.user_id= current_user.id
    respond_to do |format|
      if @micropost.save
        format.js
      end        
    end    
  end

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

  def destroy
    @micropost = Micropost.find(params[:id])
    @micropost.destroy
    respond_to do |format|
      format.js
    end
  end
end
