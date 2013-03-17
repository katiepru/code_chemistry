class UserController < ApplicationController
  def home
  end

  def profile
  end

  def list
  	@users = User.find(:all)
  end

  def show
    @user = User.find_by_username(params[:username])
  end

  def edit
    @user = User.find_by_username(params[:username])
  end

  def update
    @user = User.find_by_username(params[:username])
	if @user.update_attributes(params[:user])
      redirect_to :action => 'show', :is => @user
	else
	  render :action => 'edit'
	end
  end
end
