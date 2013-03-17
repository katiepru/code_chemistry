class SessionsController < ApplicationController
  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']
    @authorization = User.find_by_username(auth_hash["info"]["nickname"])
    if @authorization
#      render :text => "Welcome back #{@authorization.username}! You have already signed up."
		redirect_to "/user/home"
    else
      user = User.new :username => auth_hash["info"]["nickname"], :email => auth_hash["info"]["email"], :auth_token => auth_hash["credentials"]["token"]
      user.save
	  redirect_to "user/profile"
    end
  end

  def failure
    render :text => "Sorry, you didn't allow access to our app!"
  end

  def destroy
    session[:user_id] = nil
    render :text => "You've logged out!"
  end

#  def create
#   auth_hash = request.env['omniauth.auth']
#   render :text => "<pre>" + auth_hash.to_yaml + "</pre>"
#  end

end
