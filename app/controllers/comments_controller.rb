class CommentsController < ApplicationController
  def like    	
    	@comment = Comment.find(params[:id])
    	if current_user.flagged?(@comment,:like)
    		current_user.unflag(@comment,:like)
    	else
    		current_user.flag(@comment,:like)
    	end
    	respond_to do |format|
    		format.js
    	end
  end

  def create
    @comment = Comment.new(params[:comment])
    @micropost = micropost(@comment.micropost_id)
    @comment = @micropost.comments.build(params[:comment])
    @comment.post_user_id = current_user.id
    imagepost = Imagepost.where({imagepostable_id: nil, remember_token: current_user.remember_token})       
    respond_to do |format|
      if imagepost.empty?
        if @comment.save 
          imagepost.each{|i| i.update_attributes(imagepostable_id: @comment.id,
                              imagepostable_type: 'Comment')}      
          format.js
        end   
      else
        @comment.save(validate: false)
          imagepost.each{|i| i.update_attributes(imagepostable_id: @comment.id,
                              imagepostable_type: 'Comment')}       
          format.js 
      end             
    end  
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.js
    end
  end

  def micropost(id)
    Micropost.find(id)
  end

end