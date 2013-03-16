class SessionsController < ApplicationController
  def new
  end

#  def create
#    auth_hash = request.env['omniauth.auth']
#    @authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
#    if @authorization
#      render :text => "Welcome back #{@authorization.user.username}! You have already signed up."
#    else
#      user = User.new :name => auth_hash["user"]["username"], :email => auth_hash["user"]["email"]
#      user.authorizations.build :provider => auth_hash["provider"], :uid => auth_hash["uid"]
#      user.save
#      render :text => "Hi #{user.username}! You've signed up."
#    end
#  end

  def failure
    render :text => "Sorry, you didn't allow access to our app!"
  end

  def destroy
    session[:user_id] = nil
    render :text => "You've logged out!"
  end

  def create
   auth_hash = request.env['omniauth.auth']
   render :text => "<pre>" + auth_hash.to_yaml + "</pre>"
  end

end
