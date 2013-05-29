# encoding: UTF-8
class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
  	@user = User.new(params[:user])
    if @user.save
      flash[:success] = 'Вы успешно зарегистрированы.'
      redirect_to getting_started_path
    else
      flash.now[:error] = 'Извините, некоторые поля заполнены неверно.'      
      render :new
    end
  end

  def edit
    @user =  User.find_by_id(1)
    respond_to do |format|
       format.js     
    end
  end

  def update
    @user =  User.find_by_id(1)    
    @user.update_attributes(params[:user])       
  end

  def getting_started
    #current_user
    @user =  User.find_by_id(1)    
  end
end
