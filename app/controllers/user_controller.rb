class UserController < ApplicationController
  def home
  end

  def profile
  end

  def list
  	@users = User.find(:all)
  end

  def show
    @user = User.find(session[:user_id])
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])

    redirect_to '/user/show'
  end
end
