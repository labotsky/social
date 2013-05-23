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
      redirect_to @user
    else
      flash.now[:error] = 'Возникли ошибки при регистрации.'
      render :new
    end
  end
end
