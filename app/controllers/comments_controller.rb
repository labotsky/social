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
    if @comment.save
      respond_to do |format|
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