class StaticPagesController < ApplicationController
  def home
  	if signed_in?
  		redirect_to getting_started_path 	
  	else  		
  		@user = User.new 
  	end	
  end
end
