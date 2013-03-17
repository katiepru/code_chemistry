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
  end
end
