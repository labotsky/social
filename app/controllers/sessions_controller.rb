class SessionsController < ApplicationController
	def new

	end

	def create
		@user = User.new
		user = User.find_by_email(params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])			
			sign_in user
			flash[:notice] = 'Вы успешно вошли.'			
			redirect_to getting_started_path
		else
			flash.now[:notice] = 'Неверный email или пароль.'
			render 'new'  
		end		
	end

	def destroy
		sign_out
		flash[:notice] = 'Вышли.'		
		redirect_to root_url		
	end
end
