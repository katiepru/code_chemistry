class ProjectController < ApplicationController
  def create
    @user = User.find(session[:user_id])
    @project = Project.new :name => params[:name]
    @project.user_id = @user.id
    @project.save
	redirect_to '/project/show/'+@project.name
  end

  def new
    @user = User.find(session[:user_id])
  end
  
  def list
    @projects = Project.find(:all)
  end
  
  def show
    @project = Project.find_by_name(params[:name])
    @project_owner = User.find(@project.user_id)
    @octo_client = Octokit::Client.new(:login => @project_owner.username, :oauth_token => @project_owner.auth_token)
    @octo_repo = @octo_client.repository(@project_owner.username + "/" + @project.name)
    @octo_langs = @octo_client.languages(@octo_repo['full_name']).sort_by{|lang,measure| measure}.reverse

    @octo_pulls = @octo_client.pull_requests(@octo_repo['full_name'])
    
    @processed_pulls = Array.new
    @octo_pulls.each do |pull|
      pull_tabs = test_pull_request pull['diff_url']
      @processed_pulls << [pull['number'], pull['body'], pull_tabs]
    end

    logger.debug "The object is #{@processed_pulls}"
    #@tabs_used = detect_tabs_style(@project_owner.username, @project.name)
    redirect_to '/project/list' unless @project
  end
  
  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
	@project.update_attributes(params[:project])

	redirect_to '/project/show'
  end

end
