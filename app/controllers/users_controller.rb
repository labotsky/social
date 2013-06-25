# encoding: UTF-8
class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def new
  	@user = User.new
  end  

  def create
  	@user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:notice] = 'Вы успешно зарегистрированы.'
      redirect_to getting_started_path
    else
      flash.now[:notice] = 'Извините, некоторые поля заполнены неверно.'      
      render :new
    end
  end

  def edit
    @user =  current_user
    respond_to do |format|
       format.js     
    end
  end

  def update
    @user =  current_user
    @user.update_attributes(params[:user])       
  end

  def getting_started
     unless signed_in?
      redirect_to root_url
     end   
  end

  def profile         
    @microposts = current_user.microposts.includes(:flaggings)
    imagepost = Imagepost.where({micropost_id: nil, remember_token: current_user.remember_token})
    imagepost.each{|i| i.destroy}  
    unless signed_in?
      redirect_to root_url
     end    
  end
end
