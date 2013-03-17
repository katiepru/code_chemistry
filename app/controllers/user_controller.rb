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
    @langs_hash = Hash.new

    octoclient = Octokit::Client.new(:login => @user.username, :oauth_token => @user.auth_token)

    octoclient.list_repositories(@user.username).each{ |repo|
      unless repo['fork']
        octoclient.languages(repo['full_name']).each{ |lang,measure|
          if @langs_hash[lang].nil?
            @langs_hash[lang] = measure
          else
            @langs_hash[lang] += measure
          end
        }
        sleep(1/2)
      end
    }

    @langs_hash = @langs_hash.sort_by{|lang,measure| measure}.reverse
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
