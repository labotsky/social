class MicropostsController < ApplicationController

  def create
    @micropost = Micropost.new(params[:micropost])
    @micropost = current_user.microposts.build(params[:micropost])   
    imagepost = Imagepost.where({imagepostable_id: nil, remember_token: current_user.remember_token})       
    respond_to do |format|
      if imagepost.empty?
        if @micropost.save 
          imagepost.each{|i| i.update_attributes(imagepostable_id: @micropost.id,
                              imagepostable_type: 'Micropost')}      
          format.js
        end   
      else
        @micropost.save(validate: false)
          imagepost.each{|i| i.update_attributes(imagepostable_id: @micropost.id,
                              imagepostable_type: 'Micropost')}       
          format.js 
      end             
    end    
  end

  def like  	
  	@micropost = Micropost.find(params[:id])
  	if current_user.flagged?(@micropost,:like)
  		current_user.unflag(@micropost,:like)
  	else
  		current_user.flag(@micropost,:like)
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
